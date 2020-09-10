class CommentsController < ApplicationController
    
    def index
        comments = Comment.all
        render json: comments, only: [:id, :content], include: [:user, :favorite_song]
    end

    def show
        comment = Comment.find_by(id: params[:id])
        if comment
            render json: comment.slice(:id, :content, :user, :favorite_song)
        else 
            render json: { message: 'No comment found with that id' }
        end 
    end

    def create
        new_comment = Comment.create(user_id: params[:user_id], favorite_song_id: params[:favorite_song_id], content: params[:content])
<<<<<<< HEAD
        render json: new_comment, only: [:id, :user_id, :favorite_song_id, :content]
    end
=======

        render json: new_comment, only: [:user_id, :favorite_song, :content]
    
    end

   
>>>>>>> eb6597fb3c1263cc858be6432f009d5b82f24be8
end
