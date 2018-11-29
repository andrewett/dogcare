class DropTableClient < ActiveRecord::Migration[5.2]
  def change
    drop_table :clients
  end
end
