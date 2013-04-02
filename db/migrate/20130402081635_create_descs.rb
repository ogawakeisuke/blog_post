class CreateDescs < ActiveRecord::Migration
  def change
    create_table :descs do |t|
      t.integer :phase_state
      t.integer :star_state
      t.text :description

      t.timestamps
    end
  end
end
