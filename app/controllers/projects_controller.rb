class ProjectsController < ApplicationController
  def index
    @displayed_projects= Project.take(4)
    @projects= Project.all
  end
end
