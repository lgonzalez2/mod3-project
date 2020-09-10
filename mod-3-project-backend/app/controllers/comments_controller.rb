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
        render json: new_comment, only: [:id, :user_id, :favorite_song_id, :content]
    end
end
