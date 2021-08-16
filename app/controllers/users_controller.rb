class UsersController < ApplicationController
    def new
        @user = User.new()
    end

    def create
      @user = User.new(user_params)
      #@article.user = User.first
        if @user.save
            flash[:notice] = "Welcome to alpha blog #{@user.username} "
            redirect_to articles_path
      else
          render 'new'
      end
    end

private

    def user_params
        params.require(:user).permit(:username, :email, :password)
      end
end