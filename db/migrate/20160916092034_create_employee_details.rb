class CreateEmployeeDetails < ActiveRecord::Migration
  def change
    create_table :employee_details do |t|
      t.string :name
      t.string :emp_id

      t.timestamps
    end
  end
end
