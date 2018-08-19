class CreatePlanter < ActiveRecord::Migration[5.2]
  def change
    create_table :planters do |t|
      t.timestamps
    end
  end
end
