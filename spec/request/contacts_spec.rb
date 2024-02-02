require 'rails_helper'

describe 'Contacts API', type: :request do
  before do
    set_api_host
  end

  describe 'GET api/v1/contacts' do
    it 'returns status code "ok" & data array containing expected attributes' do
      get '/api/v1/contacts'
      FactoryBot.create(:contact, first_name: 'John', last_name: 'Doe', email: 'john@gmail.com')

      expect(response).to have_http_status(200)
      json_response = JSON.parse(response.body)

      expect(json_response).to have_key('status')
      expect(json_response['status']).to eq('ok')

      expect(json_response).to have_key('data')
      expect(json_response['data']).to be_an(Array)

      expected_keys = %w[id first_name last_name email created_at updated_at]

      expect(json_response['data']).to all(have_keys(*expected_keys))
    end

    it 'returns status code 200' do
      get '/api/v1/contacts'
      expect(response).to have_http_status(200)
    end

    it 'responds Time must be < 200 ms' do
      start_time = Time.now
      get '/api/v1/contacts'
      expect(response).to have_http_status(200)
      end_time = Time.now
      response_time = end_time - start_time
      expect(response_time).to be <= 0.2 # 200 ms
    end
  end
end
