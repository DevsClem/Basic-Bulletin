class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :quote
      t.string :about_me
      t.string :profile_picture

      t.timestamps
    end
  end
end
