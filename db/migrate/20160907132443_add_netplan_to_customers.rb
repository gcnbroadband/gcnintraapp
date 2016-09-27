class AddNetplanToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :net_plan, :string
  end
end
