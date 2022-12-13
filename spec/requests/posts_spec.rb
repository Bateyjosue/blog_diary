require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    user = User.create(name: 'josh', posts_counter: 0)
    user.save

    before(:each) { get "/users/#{user.id}/posts" }

    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'should render template' do
      expect(response).to render_template(:index)
    end

    it 'should return template body' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET /show' do
    user = User.create(name: 'josh', posts_counter: 0)
    user.save

    post = Post.new(title: 'post1', text: 'post testing 1', comments_counter: 1, likes_counter: 0, author_id: user.id)
    post.save

    before(:each) { get "/users/#{user.id}/posts/#{post.id}" }
    it 'returns http success' do
      expect(response).to be_successful
    end

    it 'Should render the template' do
      expect(response).to render_template(:show)
    end

    it 'should return a specific post' do
      expect(response.body).to include('Here is a specific post for a given user')
    end
  end
end
