class AddInitialColumnToPlanterStatuses < ActiveRecord::Migration[5.2]
  def change
    add_reference :planter_statuses, :planter, foreign_key: { to_table: :planters }, after: :id
    add_column :planter_statuses, :moisture, :int, :limit=>32, after: :planter_id
  end
end
