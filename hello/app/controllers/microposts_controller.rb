class MicropostsController < ApplicationController

  before_action :set_micropost, only: [:show, :edit, :update, :destroy]

  # before_filter(:signed_in_user,:only =>[:create,:destroy])
  before_filter :signed_in_user,only: [:create,:destroy]

  # GET /microposts
  # GET /microposts.json
  def index
    @microposts = Micropost.all
  end

  # GET /microposts/1
  # GET /microposts/1.json
  # def show
  # end

  # GET /microposts/new
  def new
    @micropost = Micropost.new
  end

  # GET /microposts/1/edit
  # def edit
  # end

  # POST /microposts
  # POST /microposts.json
  def create
      puts params[:micropost][:content]
      @micropost = current_user.microposts.new(micropost_params)
      if @micropost.save 
          flash[:success] = "Micropost created!"
          redirect_to root_path
      else
          render 'static_pages/home'
      end

  end

  # PATCH/PUT /microposts/1
  # PATCH/PUT /microposts/1.json
  def update
  end

  # DELETE /microposts/1
  # DELETE /microposts/1.json
  def destroy
    @micropost.destroy
    redirect_to(:back)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_micropost
      @micropost = Micropost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
