# frozen_string_literal: true

class Api::AbilitiesController < ApplicationController
  def index
    response = @client.call('/ability', index_params)
    if response.code == 304
      render json: abilities
    elsif response.code == 200
      Ability.update_abilities_table(response.to_h['data'])
      render json: abilities
    else
      render json: { message: response.message }, status: response.code
    end
  end

  def show
    response = @client.call("/ability/#{params[:id]}")
    if response.code == 304
      render json: ability
    elsif response.code == 200
      response_hash = response.to_h
      Ability.update_or_create_by(response_hash['id'], Ability.slice_attributes(response_hash))
      render json: ability
    else
      render json: { message: response.message }, status: response.code
    end
  end

  private

  # Default page = 1
  # Default limit = 50
  def index_params
    params[:page] ||= '1'
    params[:limit] ||= '50'
    params.permit :page, :limit
  end

  def abilities
    Ability.page(index_params[:page]).per(index_params[:limit])
  end

  def ability
    Ability.find_by(overwatch_id: params[:id])
  end

  def update_abilities_table(response)
    response.to_h['data'].map do |ability_attr|
      Ability.update_or_create_by(ability_attr['id'], Ability.slice_attributes(ability_attr))
    end
  end
end
