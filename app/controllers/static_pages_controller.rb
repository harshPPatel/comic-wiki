class StaticPagesController < ApplicationController
  def about
  end

  def search
    if params[:search].blank?  
      redirect_to(root_path) and return  
    else  
      @parameter = '%' + params[:search].downcase + '%'
      @category = params[:category]
      if @category == 'Volumes'
        @results = Volume.includes(:issues)
                         .all
                         .where("lower(name) LIKE :search", search: @parameter)
                         .page params[:page]
      elsif @category == 'Issues'
        @results = Issue.includes(:volume, :characters)
                        .all
                        .where("lower(name) LIKE :search", search: @parameter)
                        .page params[:page]
      elsif @category == 'Characters'
        @results = Character.includes(:issues)
                            .all
                            .where("lower(name) LIKE :search", search: @parameter)
                            .page params[:page]
      end
    end
  end
end
