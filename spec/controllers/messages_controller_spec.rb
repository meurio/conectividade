require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'initializes @message' do
      get :index
      expect(assigns :message).to be_instance_of(Message)
    end

    it 'assigns @users_count' do
      users = create_list(:user, 2)
      create_list(:message, 2, user: users.first)

      get :index

      expect(assigns :users_count).to eq(1)
    end
  end

  describe 'POST #create' do
    context 'when the data is invalid' do
      it 'does not create a new Message' do
        expect { post :create }.to raise_error { ActionController::ParameterMissing }
      end
    end

    context 'when the params are valid' do
      context 'when the user already exists' do
        before do
          user = create(:user)
          @params = {
            message: {
              user_attributes: {
                first_name: user.first_name,
                last_name: user.last_name,
                email: user.email
              }
            }
          }
        end

        it 'creates a new message' do
          expect { post :create, @params }.to change { Message.count }.by(1)
        end

        it 'does not create a new user' do
          expect { post :create, @params }.to_not change { User.count }
        end
      end

      context 'when the user does not exist' do
        before do
          user_attr = attributes_for(:user)
          @params = {
            message: {
              user_attributes: {
                first_name: user_attr[:first_name],
                last_name: user_attr[:last_name],
                email: user_attr[:email]
              }
            }
          }
        end

        it 'creates a new message' do
          expect { post :create, @params }.to change { Message.count }.by(1)
        end

        it 'creates a new user' do
          expect { post :create, @params }.to change { User.count }.by(1)
        end
      end
    end
  end
end
