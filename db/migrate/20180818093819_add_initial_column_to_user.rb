class AddInitialColumnToUser < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :name, :string, :limit=>32, after: :id
    add_column :users, :uuid, :string, :limit=>32, after: :name
  end

  def down
    remove_column :users, :name, :string
    remove_column :users, :uuid, :string
  end
end
