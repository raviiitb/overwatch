# frozen_string_literal: true

class Hero < ApplicationRecord
  has_and_belongs_to_many :abilities

  def self.update_or_create_by(id, attributes)
    hero = find_or_create_by(overwatch_id: id)
    hero.update(attributes)
    hero
  end

  def self.update_heros_table(response)
    response.to_h['data'].map do |ability_attr|
      Hero.update_or_create_by(ability_attr['id'], slice_attributes(ability_attr))
    end
  end

  def self.slice_attributes(hash)
    hash.slice('name', 'real_name', 'health', 'armour', 'shield')
  end
end
