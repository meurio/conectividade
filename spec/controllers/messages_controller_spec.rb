require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'GET #index' do
    before do
      2.times { create(:message) }
      get :index
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'initializes @message' do
      expect(assigns :message).to be_instance_of(Message)
    end

    it 'assigns @users_count' do
      expect(assigns :users_count).to eq(2)
    end
  end
end
