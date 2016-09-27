class AddUserToEmployeeDetails < ActiveRecord::Migration
  def change
    add_reference :employee_details, :user, index: true
  end
end
