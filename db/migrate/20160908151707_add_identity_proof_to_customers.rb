class AddIdentityProofToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :identity_proof, :string
  end
end
