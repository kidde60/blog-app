require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET/index' do
    it 'Check if response status is correct' do
      get '/users/:id/posts'
      expect(response).to have_http_status(:ok)
    end
    it 'should pass with status 200' do
      get '/users/120/posts'
      expect(response.status).to eql(200)
    end

    it 'should render correct template' do
      get '/users/120/posts'
      expect(response).to render_template(:index)
    end

    it 'should include correct text' do
      get '/users/120/posts'
      expect(response.body).to include('List of all posts by a user ')
    end
  end

  describe 'GET/show' do
    it 'Check if response status is correct' do
      get '/users/:id/posts/:post_id'
      expect(response).to have_http_status(:ok)
    end
    it 'should pass with status 200' do
      get '/users/120/posts/20'
      expect(response.status).to eql(200)
    end

    it 'should render correct template' do
      get '/users/120/posts/2'
      expect(response).to render_template(:show)
    end

    it 'should include correct text' do
      get '/users/120/posts/2'
      expect(response.body).to include('List of post by given id')
    end
  end
end
