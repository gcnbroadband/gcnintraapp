class AddPendingBillToBillBooks < ActiveRecord::Migration
  def change
    add_column :bill_books, :pending_bill, :string
  end
end
