class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.date :birthday
      t.text :temperament
      t.text :friends
      t.text :housing
      t.boolean :active

      t.timestamps
    end
  end
end
