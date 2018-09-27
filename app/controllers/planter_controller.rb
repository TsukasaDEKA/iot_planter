class PlanterController < ApplicationController
  protect_from_forgery except: :status_update
  protect_from_forgery except: :return_setting
  protect_from_forgery except: :update_time_span
  protect_from_forgery except: :update_threshold

  def top
    user = User.find_by(id: params[:user_id])
    @user_id = user.id
    @user_name = user.name
    @planter_list = Planter.where(user_id: params[:user_id])
  end

  def status()
    if params[:start_time].present?
      @from = Time.zone.local(params[:start_time]["date(1i)"].to_i, params[:start_time]["date(2i)"].to_i,params[:start_time]["date(3i)"].to_i,params[:start_time]["date(4i)"].to_i,params[:start_time]["date(5i)"].to_i)
    else
      @from = Time.current.ago(1.weeks)
    end
    if params[:start_time].present?
      @to = Time.zone.local(params[:end_time]["date(1i)"].to_i, params[:end_time]["date(2i)"].to_i, params[:end_time]["date(3i)"].to_i, params[:end_time]["date(4i)"].to_i, params[:end_time]["date(5i)"].to_i)
    else
      @to = Time.current()
    end
    @user_id = User.find_by(name: params[:user_name]).id
    @user_name = params[:user_name]
    @planter = Planter.find_by(id: params[:planter_id])
    planter_statuses = PlanterStatus.where(
                                    planter_id: params[:planter_id],
                                    created_at: @from..@to)
    gon.data = []
    gon.label = []
    gon.data_num = planter_statuses.count
    for planter_status in planter_statuses do
      time = planter_status.created_at
      moisture = planter_status.moisture.to_i
      gon.data << {x: time.strftime("%F %H:%M:%S"), y:moisture}
      gon.label << planter_status.created_at
    end
  end

  def new
  end

  def create
  end

  def status_update
    body_params ||= JSON.parse(request.body.read, {:symbolize_names => true})
    planter_status = PlanterStatus.new(planter_id: params[:planter_id],
                                       moisture: body_params[:moisture])
    planter_status.save
  end

  def return_setting
    @planter = Planter.find_by(id: params[:planter_id])

    planter_status = {'time_span' => @planter.time_span, 'threshold' => @planter.threshold}
    render :json => planter_status
  end

  def update_setting()
    if params[:planter].present?
      time_span = params[:planter][:time_span]
      threshold = params[:planter][:threshold]
    else
      body_params ||= JSON.parse(request.body.read, {:symbolize_names => true})
      time_span = body_params[:time_span]
      threshold = body_params[:threshold]
    end
    target_planter = Planter.find_by(id: params[:planter_id])
    target_planter.time_span = time_span
    target_planter.threshold = threshold

    target_planter.save
  end

  def update_time_span
    body_params ||= JSON.parse(request.body.read, {:symbolize_names => true})
    time_span = body_params[:time_span]
    target_planter = Planter.find_by(id: params[:planter_id])
    target_planter.time_span = time_span
    target_planter.save
  end

  def update_threshold
    body_params ||= JSON.parse(request.body.read, {:symbolize_names => true})
    threshold = body_params[:threshold]
    target_planter = Planter.find_by(id: params[:planter_id])
    target_planter.threshold = threshold
    target_planter.save
  end
end
