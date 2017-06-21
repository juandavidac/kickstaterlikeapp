class ProjectsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_pledges, only: [:show]
  load_and_authorize_resource
  def index
    @displayed_projects= Project.take(4)
    @projects= Project.all
  end

  def show
    @rewards= @project.rewards
    @days_to_go= @project.days_to_go
  end

  def create
    @project= current_user.projects.build(project_params)
    respond_to do |format|
      if @project.save
        format.html {redirect_to @project, notice: "Project successfully created"}
      else
        format.html {render :edit}
      end
    end
  end

  def new
    @project= Project.new
  end

  def edit

  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html {redirect_to @project, notice: "Project updated"}
      else
        format.html {render :edit}
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html {redirect_to projects_path, notice: "Project deleted"}
    end
  end
  private
  def set_pledges
    @pledges= @project.pledges
  end
  def set_project
    @project = Project.friendly.find(params[:id])
  end
  def project_params
    params.require(:project).permit(:name, :short_description, :description, :goal, :image_url, :expiration_date)
  end
end
