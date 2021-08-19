class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :show, :update]
    def new
        @user = User.new()
    end

    def index
        @user = User.all
    end

    def create
      @user = User.new(user_params)
        if @user.save
            flash[:notice] = "Welcome to alpha blog #{@user.username} "
            redirect_to login_path
      else
          render 'new'
      end
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Your account has been updated"
            redirect_to @user
        else
            render 'edit'
        end
    end

    def show
        @article = @user.articles
    end

private

    def set_user
        @user = User.find(params[:id])

    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
      end
end