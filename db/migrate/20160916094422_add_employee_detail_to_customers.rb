class AddEmployeeDetailToCustomers < ActiveRecord::Migration
  def change
    add_reference :customers, :employee_detail, index: true
  end
end
