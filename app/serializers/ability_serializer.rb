# frozen_string_literal: true

class AbilitySerializer < ActiveModel::Serializer
  attributes :overwatch_id, :name, :description, :is_ultimate
end
