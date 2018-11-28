class AddAvatarToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :avatar, :string
  end
end
