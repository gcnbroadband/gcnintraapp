class AddAddressProofTypeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :address_proof_type, :string
  end
end
