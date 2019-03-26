# frozen_string_literal: true

class Ability < ApplicationRecord
  has_and_belongs_to_many :heroes

  def self.update_or_create_by(id, attributes)
    ability = find_or_create_by(overwatch_id: id)
    ability.update(attributes)
    ability
  end

  def self.slice_attributes(hash)
    hash.slice('name', 'description', 'is_ultimate')
  end

  def self.update_abilities_table(ability_attrs)
    ability_attrs.map do |ability_attr|
      Ability.update_or_create_by(ability_attr['id'], Ability.slice_attributes(ability_attr))
    end
  end
end
