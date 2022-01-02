class AsController < ApplicationController
  before_action :set_a, only: %i[ show update destroy ]

  # GET /as or /as.json
  def index
    @as = A.all
  end

  # GET /as/1 or /as/1.json
  def show
    @comments = @a.comments.all
    @comment = @a.comments.build
  end

  # GET /as/new
  def new
    @a = A.new
  end

  # GET /as/1/edit
  def edit
  end

  # POST /as or /as.json
  def create
    @user = current_user
    @a = @user.as.create(a_params.merge(username: current_user.username, badge: current_user.badge))
    # @a = A.new(a_params)
    
    respond_to do |format|
      if @a.save
        if current_user.score == nil
          current_user.update_attribute(:score, 20)
          current_user.save
        else
          @new_score = current_user.score + 20
          current_user.update_attribute(:score, @new_score)
          current_user.save
        end        
        format.html { redirect_to a_url(@a), notice: "A was successfully created." }
        format.json { render :show, status: :created, location: @a }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @a.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /as/1 or /as/1.json
  def update
    if user_signed_in? && current_user.id == @a.user_id || user_signed_in? && current_user.admin
      respond_to do |format|
        if @a.update(a_params)
          format.html { redirect_to a_url(@a), notice: "A was successfully updated." }
          format.json { render :show, status: :ok, location: @a }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @a.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /as/1 or /as/1.json
  def destroy
    if user_signed_in? && current_user.id == @a.user_id ||user_signed_in? && current_user.admin
      @a.destroy

      respond_to do |format|
        format.html { redirect_to as_url, notice: "A was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_a
      @a = A.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def a_params
      params.require(:a).permit(:subject, :body, :image, :board_id)
    end
end
