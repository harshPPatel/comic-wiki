class IssuesController < ApplicationController
  def index
    @issues = Issue.includes(:characters).page params[:page]
  end

  def show
    @issue = Issue.includes(:characters).find(params[:id])
  end
end
