class CreateGcnPlans < ActiveRecord::Migration
  def change
    create_table :gcn_plans do |t|
      t.string :plan_name
      t.string :plan_price

      t.timestamps
    end
  end
end
