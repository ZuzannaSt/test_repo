class Api::V1::ProjectsController < ApiController
  before_action :set_project, only: [:show, :update, :destroy]

  def index
    @projects = Project.all
  end
  
  def show
  end
  
  def create
    @project = Project.new(project_params)
    if @project.save
      render 'show', formats: [:json], handlers: [:jbuilder], status: 200
    else
      render json: {error: "Project could not be created."}, status: 422
    end
  end
  
  def update
    if @project.update_attributes(title: params[:project][:title])
      render 'show', formats: [:json], handlers: [:jbuilder], status: 200
    else
      render json: {error: "Project could not be updated."}, status: 422
    end
  end
  
  def destroy
    if @project.destroy
      render json: {}, status: 200
    else
      render json: {error: "project could not be deleted."}, status: 422
    end
  end
  
  def with_commits
    @projects = current_user.projects.find_by(id: params[:id])
  end
  
  private
    def project_params
      params.required(:project).permit(:name)
    end

    def set_project
      @project = Project.find(params[:id])
    end
end
