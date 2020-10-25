class IssuesController < ApplicationController
  def index
    @issues = Issue.includes(:characters).all
  end

  def show
    @issue = Issue.includes(:characters).find(params[:id])
  end
end
