class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, :email, :bio, :password_hash
      t.timestamps
    end
  end
end
