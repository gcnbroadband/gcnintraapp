class AddBillBookDateToBillBooks < ActiveRecord::Migration
  def change
    add_column :bill_books, :bill_book_date, :string
    add_column :bill_books, :bill_paid_by, :string
  end
end
