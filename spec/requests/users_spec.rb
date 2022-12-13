require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before :each do
      get "/users"
    end

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'should render index template' do 
      expect(response).to render_template(:index)
    end

    it 'should return body of index template' do
      expect(response.body).to include('<h1>')
    end
  end

  describe 'GET /show' do

    user = User.create(name: 'josh', posts_counter: 0)
    user.save

    before :each do
      get "/users/#{user.id}"
    end

    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'should render show template' do
      expect(response).to render_template(:show)
    end
  
    it 'should return the body of show template' do
      expect(response.body).to include('Here is a specific user')
    end
  end
end
