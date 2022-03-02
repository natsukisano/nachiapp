class ScheduleController < ApplicationController

  def index
    @schedule = Schedule.all
  end

  def new
    @schedule = Schedule.new
  end

  def create
    Schedule.create(title: schedule_params[:title], start: schedule_params[:start], end: schedule_params[:end], allday: schedule_params[:allday])
    redirect_to root_path
  end

  # def update
  #   person = current_account.people.find(params[:id])
  #   person.update!(person_params)
  #   redirect_to person
  # end

  private
    def schedule_params
      params.require(:schedule).permit(:title, :start, :end, :allday)
    end
end
