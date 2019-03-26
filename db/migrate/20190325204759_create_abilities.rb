# frozen_string_literal: true

class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.integer :overwatch_id
      t.string :name
      t.text :description
      t.boolean :is_ultimate

      t.timestamps
    end
  end
end
