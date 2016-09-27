class CustomersController < ApplicationController

	def search
		@customer = Customer.search(params[:search_params])
		if @customer
			render partial: "look_up"
		else
			render status: not_found, nothing: true
		end
	end

	def index
		@customer = current_user.customers
		render layout: "custom"
	end

	def new
		@customer = Customer.new
		@customer.build_payment_detail
		@customer.bill_books.build
		render layout: "custom"
	end

	def create
		 # render plain: params[:customer][:employee_details][:emp_id]
		@customer = Customer.new(customer_params)
		@customer.user = current_user
		@customer.employee_detail = EmployeeDetail.where(emp_id: params[:customer][:employee_details][:emp_id]).take
		arr = params[:customer][:bill_books_attributes].map { |k, v| v["bill_amount"]}
		@customer.bill_books.each do |bill|
			bill.pending_bill = (params[:customer][:payment_detail_attributes][:total_amount].to_i - arr[0].to_i)
		end
		if @customer.save
			CustomerMailer.customer_confirmation(@customer).deliver
			flash[:success] = "Customer successfully created"
			redirect_to customers_path
		else
			render @customer
		end
	end

	def export
		
	end
	
	def show
		@customer = Customer.find(params[:id])
		@bill = BillBook.new()
		render layout: "customerdashbord"
	end

	private

	def customer_params
		params.require(:customer).permit(:date,:connection_id,:name,:mobile_no,:email,
			:telephone_no,:date_of_birth,:billing_address,:pin_no,:nationality,:installation_address,
			:installation_pin_no,:installation_telephone_no,:installation_mobile_no,:installation_email,
			:net_plan,:address_proof,:address_proof_type, :address_proof_no, :identity_proof,:identity_proof_type,:identity_proof_no,
			payment_detail_attributes: [:plan_cost, :plan_tax, :monthly_payment_cost,:id, :no_of_months_paid,
			:installation_charge, :company_material_use, :company_material_cost, :total_amount, :pending_amount ],
			bill_books_attributes: [:bill_book_date,:bill_book_no,:bill_no,:bill_amount, :bill_paid_by],employee_detail_ids: [])
	end
end

