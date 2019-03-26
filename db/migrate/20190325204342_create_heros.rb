# frozen_string_literal: true

class CreateHeros < ActiveRecord::Migration[5.2]
  def change
    create_table :heros do |t|
      t.integer :overwatch_id
      t.string :name
      t.string :real_name
      t.integer :health
      t.integer :armour
      t.integer :shield

      t.timestamps
    end
  end
end
