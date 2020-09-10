class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, only: [:id, :username], include: [:favorite_songs, :comments]
    end

    def show
        user = User.find_by(id: params[:id])
        if user
            render json: user.slice(:id, :username, :favorite_songs, :comments)
        else 
            render json: { message: 'No user found with that id' }
        end 
    end

    def create 
        new_user = User.create(username: params[:username])

        render json: new_user, only: [:id, :username]
    end

end
