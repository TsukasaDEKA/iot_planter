class CreatePlanterStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :planter_statuses do |t|
      t.timestamps
    end
  end
end
