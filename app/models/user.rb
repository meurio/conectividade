class User < ActiveRecord::Base
  has_many :messages

  validates :first_name, :last_name, :email, presence: true
end
