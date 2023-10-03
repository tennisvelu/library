require 'rails_helper'

RSpec.describe 'Api::V1::Libraries', type: :request do
  include RSpec::Rails::RequestExampleGroup # Include the module to access json method
  let(:user) { create(:user) }
  let(:library) { create(:library) }
  let!(:available_book) { Book.create(title: 'the aunt', status: :available, library: library) }
  let!(:checked_out_book) do
    Book.create(name: 'Book',status: :checked_out,checked_out_by: user.id,library: library)
  end
  let!(:token) {JwtService.encode(user_id: user.id)}

  describe 'GET /api/v1/libraries/:library_id/books' do

    before { get "/api/v1/libraries/#{library.id}/books", headers: { "Authorization" => "#{token}" } }

    it 'returns library name' do
      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)['library']).to eq(library.name)
    end

    it 'list books with status' do
      expect(response).to have_http_status(200)
      json_data = JSON.parse(response.body)

      expect(json_data['books'].count).to eq(2)

      book1 = json_data['books'][0]
      book2 = json_data['books'][1]

      expect(book1['title']).to eq(available_book.title)
      expect(book2['title']).to eq(checked_out_book.title)

      expect(book1['status']).to eq('available')
      expect(book2['status']).to eq('checked_out')

      expect(book2['checked_out_by']).to eq(user.id)
    end
  end
end