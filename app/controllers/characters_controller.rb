class CharactersController < ApplicationController
  def index
    @characters = Character.includes(:issues).all
  end

  def show
    @character = Character.includes(:issues).find(params[:id])
  end
end
