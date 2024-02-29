class YogaPosesController < ApplicationController
  def index
    @yoga_poses = YogaPose.order(:name)
    render :index
  end

  def show
    @yoga_pose = YogaPose.find(params[:id])
    render :show
  end
end
