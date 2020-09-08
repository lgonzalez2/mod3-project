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
   
end
