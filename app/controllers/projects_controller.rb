class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @displayed_projects= Project.take(4)
    @projects= Project.all
  end
  def show

  end
  def new
    @project= Project.new
  end
  def edit

  end
end
