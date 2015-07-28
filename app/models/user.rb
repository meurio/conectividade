class User < ActiveRecord::Base
  has_many :messages

  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true

  def name
    "#{first_name} #{last_name}"
  end

  def student?
    role == 'student'
  end

  def teacher?
    role == 'teacher'
  end
end
