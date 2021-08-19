class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Logged in successfuly"
            redirect_to user
        else
            flash.now[:alert] = "There was wrong with your credetianls you entered"
            render 'new'
        end
    end

    def destroy
        session[:id] = nil
        flash[:notice] = "Logged Out"
        redirect_to root_path
    end
    
end