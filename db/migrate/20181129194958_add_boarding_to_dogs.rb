class AddBoardingToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :boarding, :boolean
  end
end
