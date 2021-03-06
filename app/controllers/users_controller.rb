class UsersController < ApplicationController
    before_action :set_user, only: [:show]
    
    skip_before_action :logged_in_user, \
        only:[:new,:create]
    
    before_action :authorize, only: [:create, :new]
    

    def show
    end
  
    def new
      @user = User.new

    end

    def index
      @users = User.all 

    end  
  
    def create
      @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to rooms_path, notice: 'User was succesfully created.'
        #redirect_to @user, notice: 'User was successfully created.'
      else
        render 'new'
      end
    end
  
    def edit
      @user = User.find(params[:id])
    end

    def update
    
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'user was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

    private
    def set_user
      @user = User.find(params[:id])
    end

    
    def user_params
      params.require(:user).permit(:name, :email, :birthdate, :password, :password_confirmation)
    end
  end
