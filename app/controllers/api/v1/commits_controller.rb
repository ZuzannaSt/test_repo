class Api::V1::CommitsController < ApiController
  before_action :set_commit, only: [:show, :destroy]

  def index
    respond_with(commits: Commit.all ? Commit.all : [])
  end

  def show
    respond_with(commit: @commit ? @commit : [])
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
end

