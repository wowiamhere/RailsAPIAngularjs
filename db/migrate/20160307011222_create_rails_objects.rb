class CreateRailsObjects < ActiveRecord::Migration
  def change
    create_table :rails_objects do |t|
      t.string :firstName
      t.string :lastName
      t.string :gender

      t.timestamps null: false
    end
  end
end
