class CreateFloorplans < ActiveRecord::Migration
  def change
    create_table :floorplans do |t|
      t.string :display_name, null: false
      t.text :blueprint
      t.integer :project_id, null: false

      t.timestamps null: false
    end
  end
end
