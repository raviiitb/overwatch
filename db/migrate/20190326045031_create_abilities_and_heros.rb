# frozen_string_literal: true

class CreateAbilitiesAndHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities_heros do |t|
      t.belongs_to :ability, index: true
      t.belongs_to :hero, index: true
    end
  end
end
