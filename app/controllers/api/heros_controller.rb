# frozen_string_literal: true

class Api::HerosController < ApplicationController
  def index
    response = @client.call('/hero', index_params.to_h)
    if response.code == 304
      render json: heros
    elsif response.code == 200
      Hero.update_heros_table(response)
      render json: heros
    else
      render json: { message: response.message }, status: response.code
    end
  end

  def show
    response = @client.call("/hero/#{params[:id]}")
    @hero = hero(params[:id])

    if response.code == 304
      render json: hero(params[:id])
    elsif response.code == 200
      create_hero_entity_relationship(params[:id], response.to_h)
      render json: hero(params[:id])
    else
      render json: { message: response.message }, status: response.code
    end
  end

  def hero_abilities
    response = @client.call("/hero/#{params[:hero_id]}")
    if response.code == 304
      render json: hero(params[:hero_id]).abilities.page
    elsif response.code == 200
      create_hero_entity_relationship(params[:hero_id], response.to_h)
      render json: hero(params[:hero_id]).abilities.page
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

  def heros
    Hero.page(index_params[:page]).per(index_params[:limit])
  end

  def hero(id)
    @hero ||= Hero.find_by(overwatch_id: id)
  end

  def create_hero_entity_relationship(hero_id, response_hash)
    Hero.update_or_create_by(response_hash['id'], Hero.slice_attributes(response_hash))
    Ability.update_abilities_table(response_hash['abilities'])
    ability_overwatch_ids = response_hash['abilities'].pluck('id')
    hero(hero_id).abilities << Ability.where(overwatch_id: ability_overwatch_ids)
  end
end
