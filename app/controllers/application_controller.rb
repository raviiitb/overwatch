# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :client

  private

  def client
    @client = ApiClient.new(CONFIG['overwatch_api_endpoint'])
  end
end
