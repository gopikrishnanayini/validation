class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	respond_to do |format|
  		if @user.save
  			format.html { redirect_to @user, notice: 'USER WAS SUCCESSFULLY CREATED.' }
  			format.json { render json: @user, status: :created, location: @user }
  		else
  			format.html { render action: 'new' }
  			format.json { render json: @user.errors, status: :unprocessable_entity }
  		end
  	end
  end


  def show
  	@user = User.find(params[:id])
  end
  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
  	respond_to do |format|
	  	if @user.update(event_params)
	  		format.html { redirect_to @user, notice: 'user was successfully created.'}
	  		format.json { render json: @user, status: :created, location: @user }
	  	else
	  		format.html { render action: "update" }
	  		format.json {render json: @user.errors, status: :unprocessable_entity}
	  	 end
  	end
  end
  def destroy
  	@user= User.find(params[:id])
  	@event.destroy
  	 redirect_to users_path
  end
  
  private
    def user_params
    	params.require(:user).permit(:firstname, :lastname, :age, :email)
    end
end

