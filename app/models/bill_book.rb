class BillBook < ActiveRecord::Base
  belongs_to :customer

  validates :bill_book_date, presence:true, length:{minimaum:3, maximum:25}
  validates :bill_book_no, presence:true, length:{minimaum:1, maximum:25}
  validates :bill_no, presence:true, length:{minimaum:1, maximum:25}
  validates :bill_amount, presence:true, length:{minimaum:1, maximum:25}
  validates :bill_paid_by, presence:true, length:{minimaum:1, maximum:25}


end
