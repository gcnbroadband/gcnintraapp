class AddIstallationaddressToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :installation_address, :text
  	add_column :customers, :installation_pin_no, :string
  	add_column :customers, :installation_telephone_no, :string
  	add_column :customers, :installation_mobile_no, :string
  	add_column :customers, :installation_email, :string
  end
end
