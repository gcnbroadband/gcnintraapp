class BillBooksController < ApplicationController
    def index
    end

    def show
    end

    def new
        @bill = BillBook.new
    end
    def create
        #render plain: params[:customer][:customer_id]
        @bill = BillBook.new(bill_book_params)
        @bill.customer_id = params[:customer][:customer_id]
        @customer = Customer.find(@bill.customer_id)

        @bill.pending_bill =  ((@customer.payment_detail.total_amount.to_i - @customer.bill_books.sum(:bill_amount)) - params[:bill_book][:bill_amount].to_i)
        
        if @bill.save
            redirect_to customer_path(@bill.customer)
        else
            render customer_path(@bill.customer)
        end
       

    end

    def edit
    end

    def destroy
    end

    def update
    end

    private
    def bill_book_params
        params.require(:bill_book).permit(:bill_book_no, :bill_no, :bill_amount, :bill_paid_by, :bill_book_date, :customer_id)
    end
end
