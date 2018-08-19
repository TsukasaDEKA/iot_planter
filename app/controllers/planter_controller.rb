class PlanterController < ApplicationController
  protect_from_forgery except: :update
  def top
    user = User.find_by(id: params[:user_id])
    @user_name = user.name
    @planter_list = Planter.where(user_id: params[:user_id])
  end

  def status
    @planter = Planter.find_by(id: params[:planter_id])
    planter_statuses = PlanterStatus.where(planter_id: params[:planter_id])
    gon.data = []
    gon.label = []
    gon.data_num = planter_statuses.count
    for planter_status in planter_statuses do
      gon.data << planter_status.moisture
      gon.label << planter_status.created_at
    end
  end

  def new
  end

  def create
  end

  def update
    body_params ||= JSON.parse(request.body.read, {:symbolize_names => true})
    planter_status = PlanterStatus.new(planter_id: params[:planter_id],
                                       moisture: body_params[:moisture])
    planter_status.save
  end
end
