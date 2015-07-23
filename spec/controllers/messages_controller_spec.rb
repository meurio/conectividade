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

  describe 'POST #create' do
    context 'when the data is invalid' do
      it 'does not create a new Message' do
        expect { post :create }.to raise_error { ActionController::ParameterMissing }
      end
    end

    context 'when the params are valid' do
      it 'creates a new message' do
        valid_user = attributes_for(:user)
        expect { post :create,
          message: {
            user_attributes: {
              first_name: valid_user[:first_name],
              last_name: valid_user[:last_name],
              email: valid_user[:email]
            }
          }
        }.to change { Message.count }.by(1)
      end
    end
  end
end
