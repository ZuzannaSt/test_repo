class Api::V2::BranchesController < ApiController
  before_action :set_branch, only: [:show, :destroy]

  def index
    respond_with(branches: Branch.all ? Branch.all : [])
  end

  def show
    respond_with(branch: @branch ? @branch : [])
  end

  def create
    @branch = Branch.new(branch_params)
    if @branch.save
      render json: @branch, serializer: BranchSerializer, status: 200
    else
      render json: {error: "Branch could not be created."}, status: 422
    end
  end
  
  def update
    if @branch.update(branch_params)
      render json: @branch, serializer: BranchSerializer, status: 200
    else
      render json: {error: "Branch could not be updated."}, status: 422
    end
  end

  def destroy
    if @branch
      @branch.destroy
      render json: {}, status: 200
    else
      render json: { error: "Branch could not be deleted."}, status: 422
    end
  end

  private
    def branch_params
      params.required(:branch).permit(:name)
    end
    
    def set_branch
      @branch = Branch.find_by(id: params[:id])
    end
end

