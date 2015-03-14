class Api::V1::ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
end
