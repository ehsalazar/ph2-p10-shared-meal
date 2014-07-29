class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :location, :comments
      t.date :date
      t.boolean :active, default: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
