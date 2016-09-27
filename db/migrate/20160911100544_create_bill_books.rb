class CreateBillBooks < ActiveRecord::Migration
  def change
    create_table :bill_books do |t|
      t.string :bill_book_no
      t.string :bill_no
      t.string :bill_amount
      t.references :customer, index: true

      t.timestamps
    end
  end
end
