class ScheduleController < ApplicationController

  def index
    @schedule = Schedule.all.order(id: "DESC")
  end

  def new
    @schedule = Schedule.new
  end

  def create
    @sche = Schedule.create(title: schedule_params[:title], start: schedule_params[:start], end: schedule_params[:end], allday: schedule_params[:allday])
    if @sche.save
      flash[:notice] = 'スケジュールが登録されました'
      redirect_to root_path
    else
      flash.now[:alert] = '全て入力してください'
      render "new"
    end
  end

  def show
    @schedule = Schedule.find(params[:id])
  end

  def edit
    @schedule = Schedule.find(params[:id])
  end

  def update
    # person = current_account.people.find(params[:id])
    @schedule = Schedule.find(params[:id])
    @schedule.update(schedule_params)
    redirect_to schedule_path(@schedule.id)
  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy
    redirect_to root_path
  end

  private
    def schedule_params
      params.require(:schedule).permit(:title, :start, :end, :allday)
    end
end
