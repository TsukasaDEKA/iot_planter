class AddInitialColumnToPlanter < ActiveRecord::Migration[5.2]
  def change
    add_reference :planters, :user, foreign_key: { to_table: :users }, after: :id
    add_column :planters, :name, :string, :limit=>32, after: :user_id
  end
end
