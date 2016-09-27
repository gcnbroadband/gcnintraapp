class EmployeeDetailsController < ApplicationController
  layout 'custom'
  

  def search
  	@employee = EmployeeDetail.search(params[:search_params])
  	if @employee
  		render partial: "look_up"
  	else
  		render status: not_found, nothing: true
  	end
  end

  def index
  	@employee = current_user.employee_details

  end

  def new
  	@employee = EmployeeDetail.new
  end

  def create
  	@employee = EmployeeDetail.new(employee_params)
  	@employee.user = current_user

  	if @employee.save
  		flash[:success] = "Employee successfully created"
  		redirect_to employee_details_path
  	else
  		flash[:success] = "Something went wrong"
  		render 'new'
  	end
  end

  def show
  end

  def edit
  end

  private
  def employee_params
  	params.require(:employee_detail).permit(:name, :emp_id)
  end

end
