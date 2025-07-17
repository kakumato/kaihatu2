class VotesController < ApplicationController
  before_action :set_poll

  def index
    @poll = Poll.find(params[:poll_id])
    @votes = @poll.votes
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new(vote_params)
    @vote.user_id = session[:user_id]
    @vote.poll_id = @poll.id  # poll_id をセット（セキュリティ的にも明示する）

    if @vote.save
      redirect_to polls_path, notice: "投票が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_poll
    @poll = Poll.includes(:choices).find(params[:poll_id])
  end

  def vote_params
    params.require(:vote).permit(:choice_id)  # poll_id, user_id はコントローラで代入するのが安全
  end
end
