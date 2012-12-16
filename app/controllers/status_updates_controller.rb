class StatusUpdatesController < ApplicationController
  prepend_before_filter :authenticate_user!, :load_mission_enrollment
  before_filter         :load_status_update


  def create
    @status_update = StatusUpdate.new(params[:status_update])
    if @status_update.save
      redirect_to mission_enrollment_path(current_user.nickname, @status_update.mission_enrollment.mission.slug)
    else
      render "new"
    end
  end

  def update
  end

  def destroy
  end

  private
  def load_mission_enrollment
    @mission_enrollment = MissionEnrollment.find params[:mission_enrollment_id]
  end

  def load_status_update
    @status_update = @mission_enrollment.status_updates.build
  end
end