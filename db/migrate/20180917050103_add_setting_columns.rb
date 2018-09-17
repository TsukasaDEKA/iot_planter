class AddSettingColumns < ActiveRecord::Migration[5.2]
  def up
    add_column :planters, :time_span, :int, :limit=>32, default: 30, null: false, after: :name
    add_column :planters, :threshold, :int, :limit=>32, default: 50, null: false, after: :time_span
  end

  def down
    remove_column :planters, :time_span, :int
    remove_column :planters, :threshold, :int
  end
end
