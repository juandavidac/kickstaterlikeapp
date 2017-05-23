class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @displayed_projects= Project.take(4)
    @projects= Project.all
  end
  def show

  end
  def create
    @project= current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        format.html {redirect_to @project, notice: "Project successfully created"}
      else
        format.html {redirect_to :edit}
      end
    end
  end
  def new
    @project= Project.new
  end
  def edit

  end
  private
  def set_project
    @project = Project.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:name, :short_description, :description, :goal, :image_url, :expiration_date)
  end
end
