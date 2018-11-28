class DropDaycare < ActiveRecord::Migration[5.2]
  def change
    drop_table :daycares
  end
end
