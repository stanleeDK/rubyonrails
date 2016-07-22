  class UsersController < ApplicationController
  
  before_action(:set_user, only: [:show, :edit, :update, :destroy])
  before_filter(:signed_in_user, :only =>[:edit,:update, :index]) #before invoking edit() or update(), or index() call signed_in_user


  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])  
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end


  def testrender
    # render "static_pages/home"
    render text: "OK"
  end 

  # POST /users
  # POST /users.json
  def create

    # puts "hello"
    # p user_params
    @user = User.new(user_params) #user_params is a function below 
    # p @user
    if @user.save 
      sign_in(@user)
      redirect_to @user
    end 

    
    # @user = User.new(params[:user])
    # @user = User.new( name: "Foo Bar", email: "foo@invalid", password: "foo", password_confirmation: "bar")    
    # if params[:user][:name] == ""
    #   render :new
    # else
    #     @user.save 
    #     # redirect_to(@user)
    #     render :show
    # end 

    # -- original auto generated code -- 
    # respond_to do |format|
    #   if @user.save
    #     format.html { redirect_to @user, notice: 'User was successfully created.' }
    #     format.json { render :show, status: :created, location: @user }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      @user = User.find(params[:id])    
      p @user

      # p params[:user]
      
      # @user.update(user_params2)
      if @user.update_attribute(:name,params[:user][:name]) && 
         @user.update_attribute(:email,params[:user][:email]) &&
         @user.authenticate(params[:user][:password])
          flash[:success] = "Profile Updated"
          redirect_to @user
      else
          flash[:success] = "Password is wrong"
          redirect_to @user
      end
      
    
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # This function is called every time a user tries to access an edit page http://localhost:3000/users/6/edit
    def signed_in_user 
      if signed_in? == false
        flash[:success] = "Please sign in!"
        redirect_to(signin_path)
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :remember_token)
    end

end
