class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :location, :comments, :date, :time
      t.boolean :active, default: false
      t.belongs_to :user
      t.timestamps
    end
  end
end
