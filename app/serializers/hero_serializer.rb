# frozen_string_literal: true

class HeroSerializer < ActiveModel::Serializer
  attributes :overwatch_id, :name, :real_name, :health, :armour, :shield
end
