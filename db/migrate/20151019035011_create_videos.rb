class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :name
      t.string :description
      t.string :embedcode
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
