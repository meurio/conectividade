class Message < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user

  validates :user_id, presence: true

  after_create { AppMailer.thanks(self).deliver_now }
end
