class AddAddressProofToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :address_proof, :string
  end
end
