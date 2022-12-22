require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET/index' do
    it 'Check if response status is correct' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
    it 'passes with status 200' do
      get '/'
      expect(response.status).to eql(200)
    end

    it 'renders correct template' do
      get '/'
      expect(response).to render_template(:index)
    end

    it 'includes correct text' do
      get '/'
      expect(response.body).to include('List of all users')
    end
  end

  describe 'GET/show' do
    it 'Check if response status is correct' do
      get '/users/:id'
      expect(response).to have_http_status(:ok)
    end
    it 'passes with status 200' do
      get '/users/1'
      expect(response.status).to eql(200)
    end

    it 'renders correct template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'includes correct text' do
      get '/users/1'
      expect(response.body).to include('List of user by given id')
    end
  end
end
