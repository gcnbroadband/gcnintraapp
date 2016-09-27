class GcnPlansController < ApplicationController
  layout 'custom'

  def index
  	@plan = GcnPlan.all
  end

  def show
  end

  def new
  	@plan = GcnPlan.new
  end

  def create
	# render plain: params_plan
	@plan = GcnPlan.new(params_plan)

	if @plan.save
		flash[:success] = "Plan Successfully created"
		redirect_to gcn_plans_path

	else
		render 'new'
	end

  end


  private

  def params_plan
  	params.require(:gcn_plan).permit(:plan_name, :plan_price)
  end
end
