class VolumesController < ApplicationController
  def index
    @volumes = Volume.includes(:issues).all
  end

  def show
    @volume = Volume.includes(:issues).find(params[:id])
  end
end
