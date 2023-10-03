require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  describe 'POST #login' do
    let!(:user) { User.create( email: 'testuser@example.com', password: 'password', username: "testuser") }

    context 'Valid Credentials' do
      before do
        post :login, params: { email: 'testuser@example.com', password: 'password' }
      end

      it 'returns a JWT token' do
        expect(response).to have_http_status(:ok)
        json_response = JSON.parse(response.body)
        expect(json_response['token']).to be_present
      end

      it 'returns an expiration time' do
        json_response = JSON.parse(response.body)
        expect(json_response['exp']).to be_present
      end

      it 'returns the username' do
        json_response = JSON.parse(response.body)
        expect(json_response['username']).to eq(user.username)
      end
    end

    context 'Invalid Credetials' do
      before do
        post :login, params: { email: 'testuser@example.com', password: 'password_invalid' }
      end

      it 'returns unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns an error message' do
        json_response = JSON.parse(response.body)
        expect(json_response['error']).to eq('unauthorized')
      end
    end
  end
end
