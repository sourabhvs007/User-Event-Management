class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :venue
      t.string :date
      t.string :time
      t.string :description
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
