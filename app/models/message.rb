class Message < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user

  validates :user_id, presence: true

  after_create { AppMailer.delay.thanks(self) }
  after_create { AppMailer.delay.message_for_the_president(self) }
  after_create { self.delay.add_to_mailchimp_segment }

  def add_to_mailchimp_segment
    begin
      Gibbon::API.lists.subscribe(
        id: ENV["MAILCHIMP_LIST_ID"],
        email: { email: self.user.email },
        merge_vars: {
          FNAME: self.user.first_name,
          LNAME: self.user.last_name
        },
        double_optin: false,
        update_existing: true
      )
      Gibbon::API.lists.static_segment_members_add(
        id: ENV["MAILCHIMP_LIST_ID"],
        seg_id: ENV["MAILCHIMP_MESSAGES_SEG_ID"],
        batch: [{ email: self.user.email }]
      )
    rescue Exception => e
      Rails.logger.error e
    end
  end
end
