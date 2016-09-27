class AddAddressProofNoToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :address_proof_no, :string
  end
end
