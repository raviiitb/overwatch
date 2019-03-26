# frozen_string_literal: true

require 'rails_helper'
require 'factory_bot'

RSpec.describe Api::HerosController, type: :controller do
  before(:all) do
    create(:hero)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['data'][0]['attributes']).to include('overwatch-id', 'name', 'real-name', 'health', 'armour', 'shield')
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: { id: 1 }
      expect(response).to have_http_status(:success)
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['data']['attributes']).to include('overwatch-id', 'name', 'real-name', 'health', 'armour', 'shield')
    end
  end

  describe 'GET #hero_abilities' do
    it 'returns http success' do
      get :hero_abilities, params: { hero_id: 1 }
      expect(response).to have_http_status(:success)
    end
  end
end
