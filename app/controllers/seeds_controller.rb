class SeedsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @event = Event.find(params[:id])
    if current_user.captain?
      @team = current_user.athlete.school.teams.where({ discipline: @event.discipline, sex: @event.sex }).first
    else
      @teams = Team.all.includes(:athletes, :school).where({ discipline: @event.discipline, sex: @event.sex })
    end    
    render :show
  end
  
  def update
    seed = Seed.find(params[:id])
    seed.seeded = params[:seeded]
    seed.save
    render nothing: true
  end
    
end