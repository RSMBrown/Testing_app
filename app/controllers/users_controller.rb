class UsersController < ApplicationController
    def register
        @user = User.new
    end 

    def register_save
        @user = User.new(user_params)
        
        if @user.save
            redirect_to profiles_path(user_id: @user.id)
        else 
            render :register
        end 
    end 

    def log_in
    end 

    def log_in_check
        @user = User.find_by(email: (params[:email]))
        if @user.present?
            if (params[:password]) == @user.password
                redirect_to profiles_path(user_id: @user.id)
            end 
        else 
            flash[:alert] = "User does not exist, please register"
            redirect_to register_path
        end 
    end 

    private 
    def user_params
        params.require(:user).permit(:email, :password)
    end 
end
