class ProfilesController < ApplicationController

    def index 
        @user = User.find(params[:user_id])
    end

    def show 
        @user = User.find(params[:user_id])
        @profile = Profile.find(params[:id])
    end

    def create 
        @user = User.find(params[:user_id])
        if @user.profile.present?
            @profile = @user.profile
            redirect_to profile_path(user_id: @user.id, id: @profile.id)
        else 
            @profile = @user.create_profile
            redirect_to profile_path(user_id: @user.id, id: @profile.id)
        end
    end

    def edit 
        @user = User.find(params[:user_id])
        @profile = Profile.find(params[:id])
    end

    def update 
        @user = User.find(params[:profile][:user_id])
        @profile = @user.profile
        @profile.update(profile_params)

        redirect_to profile_path(user_id: @user.id, id: @profile.id)
    end

    def destroy 
        @user = User.find(params[:user_id])
        @profile = @user.profile 
        @profile.destroy 
        @user.destroy 

        redirect_to register_path
    end

    private 

    def profile_params
        params.require(:profile).permit(:name, :surname, :date_of_birth, :username, :image, :user_id)
    end
end
