require 'rails_helper'

RSpec.describe 'API', type: :request do
  before do
    create :link, :facebook
    create :link, :beenverified
  end

  describe 'GET /*path' do
    before { get '/b'}
    let(:json) {JSON.parse(response.body)}

    it 'returns the original url' do
      expect(json).not_to be_empty
      expect(json['redirect']).to eq("https://Facebook.com")
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /*url' do
    subject {ActionDispatch::Request}

    it 'should create a new URL' do
      subject.any_instance.stub_chain("body.read") { 'https://something.com' }
      post '/https://something.com'

      expect(Link.count).to eq(3)
    end

    it 'should throw an error if URL is already taken' do
      subject.any_instance.stub_chain("body.read") { 'https://Facebook.com' }
      post '/https://Facebook.com'

      expect(response.body.include?('has already been taken')).to be
      expect(Link.count).to eq(2)
    end
  end

  describe 'GET /top' do
    it 'should return top 100 links' do
      get '/top'

      expect(response.body.include?('top_100')).to be
    end

  end

end
