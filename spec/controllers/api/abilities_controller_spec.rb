# frozen_string_literal: true

require 'rails_helper'
require 'factory_bot'

RSpec.describe Api::AbilitiesController, type: :controller do
  before(:all) do
    create(:ability)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['data'][0]['attributes']).to include('description', 'name', 'overwatch-id', 'is-ultimate')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['data']['attributes']).to include('description', 'name', 'overwatch-id', 'is-ultimate')
    end
  end
end
