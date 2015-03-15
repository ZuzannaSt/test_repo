class Api::V2::CommitsController < ApiController
  before_action :set_commit, only: [:show, :destroy]

  def index
    respond_with(commits: Commit.all ? Commit.all : [])
  end

  def show
    respond_with(commit: @commit ? @commit : [])
  end

  def create
     @commit = Commit.new(commit_params)
    if @commit.save
      render 'show', formats: [:json], handlers: [:jbuilder], status: 200
    else
      render json: {error: "Commit could not be created."}, status: 422
    end
  end

  def destroy
    if @commit
      @commit.destroy
      render json: {}, status: 200
    else
      render json: { error: "Commit could not be deleted."}, status: 422
    end
  end

  private
    def set_commit
      @commit = Commit.find_by(id: params[:id])
    end

    def commit_params
      params.required(:commit).permit(:name)
    end
end

