class DropDailyReports < ActiveRecord::Migration[5.2]
  def change
    drop_table :daily_reports
  end
end
