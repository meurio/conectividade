require 'rails_helper'

RSpec.describe User, type: :model do
  before { create(:user) }

  it { should have_many :messages }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }
  it { should validate_presence_of :email }
  it { should validate_uniqueness_of :email }

  describe '#name' do
    it 'returns the full name' do
      user = create :user
      expect(user.name).to include(user.first_name)
      expect(user.name).to include(user.last_name)
    end
  end

  describe '#student?' do
    context 'when the user is a student' do
      it 'returns true' do
        user = create :user, role: 'student'
        expect(user.student?).to be_truthy
      end
    end

    context 'when the user is not a student' do
      it 'returns false' do
        user = create :user
        expect(user.student?).to be_falsey
      end
    end
  end

  describe '#teacher?' do
    context 'when the user is a teacher' do
      it 'returns true' do
        user = create :user, role: 'teacher'
        expect(user.teacher?).to be_truthy
      end
    end

    context 'when the user is not a teacher' do
      it 'returns false' do
        user = create :user
        expect(user.teacher?).to be_falsey
      end
    end
  end
end
