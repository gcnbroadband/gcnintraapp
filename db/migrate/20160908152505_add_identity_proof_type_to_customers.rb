class AddIdentityProofTypeToCustomers < ActiveRecord::Migration
  def change
  	add_column :customers, :identity_proof_type, :string
  	add_column :customers, :identity_proof_no, :string
  end
end
