class PollsController < ApplicationController
  before_action :set_poll, only: %i[ show edit update destroy ]

  # GET /polls or /polls.json
  def index
     @polls = Poll.includes(:choices, :votes)
  end

  # GET /polls/1 or /polls/1.json
  def show
    @poll = Poll.find(params[:id])

    @vote_counts = @poll.choices
                        .left_joins(:votes)
                        .group(:id, :option_text)
                        .count('votes.id')
  end

  # GET /polls/new
  def new
    @poll = Poll.new
    2.times {@poll.choices.build}
  end

  # GET /polls/1/edit
  def edit
  end

  # POST /polls or /polls.json
  def create
    @poll = Poll.new(poll_params)
    @poll.user_id = session[:user_id]

    respond_to do |format|
      if @poll.save
        format.html { redirect_to @poll, notice: "アンケートを作成しました" }
        format.json { render :show, status: :created, location: @poll }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polls/1 or /polls/1.json
  def update
    respond_to do |format|
      if @poll.update(poll_params)
        format.html { redirect_to @poll, notice: "Poll was successfully updated." }
        format.json { render :show, status: :ok, location: @poll }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poll.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polls/1 or /polls/1.json
  def destroy
    @poll.destroy!

    respond_to do |format|
      format.html { redirect_to polls_path, status: :see_other, notice: "Poll was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poll
      @poll = Poll.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def poll_params
      params.require(:poll).permit(:title, :description, choices_attributes: [:id, :option_text, :_destroy])
    end
end
