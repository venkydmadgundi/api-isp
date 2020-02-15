require 'rails_helper'
 
describe ProvidersController, type: :request do
  let(:provider) { FactoryBot.build(:provider) }
  

  describe 'GET index' do
  	let!(:providers) {FactoryBot.create_list(:random_provider, 20)}	
    it 'returns all providers with status' do
      get providers_path
      expect(JSON.parse(response.body).size).to eq(20)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST ' do
  	provider_params = {
  		name: "Posting Provider",
		email: "test@user.com",
		lowest_price: 20,
		rating: "75.55",
		max_speed: "100",
		description: "This is testing provider for test user",
		contact_no: "9623189233",
		image: "test",
		url: "http://post.com/testing"
  	}
  	before do 
  		post providers_url, params: {provider: provider_params}
  	end

  	it 'returns the provider' do
  		body = JSON.parse(response.body)
  		provider_params.each do |key, value|
	    	expect(body["#{key}"]).to eq(value)
	    end
	    expect(response).to have_http_status(:created)
	end

  end

end