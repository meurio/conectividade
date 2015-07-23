class Message < ActiveRecord::Base
  belongs_to :user
  accepts_nested_attributes_for :user

  validates :user_id, presence: true
end
