class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @user = current_user
    @comment = @user.comments.create(comment_params.merge(username: current_user.username))
    # @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        if current_user.score == nil
          current_user.update_attribute(:score, 20)
          current_user.save
        else
          @new_score = current_user.score + 20
          current_user.update_attribute(:score, @new_score)
          current_user.save
        end     
        @rightnow = @comment.a_id.to_s
        format.html { redirect_to '/void/'+@rightnow, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        @rightnow = @comment.a_id.to_s
        format.html { redirect_to '/void/'+@rightnow, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    if user_signed_in? && current_user.admin
      @comment.destroy

      respond_to do |format|
        format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:username, :comment, :a_id)
    end
end
