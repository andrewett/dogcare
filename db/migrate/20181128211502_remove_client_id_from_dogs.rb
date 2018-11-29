class RemoveClientIdFromDogs < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :client_id
  end
end
