class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, only: [:id, :first_name, :last_name, :username], include: [:favorite_songs, :comments]
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user.slice(:id, :first_name, :last_name, :username, :favorite_songs, :comments)
        else 
            render json: { message: 'No user found with that id' }
        end 
    end

end
