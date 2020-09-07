class FavoriteSongsController < ApplicationController

    def index
        favorite_songs = FavoriteSong.all
        render json: favorite_songs, only: [:id, :title, :artist, :video_url, :likes], include: [:user, :comments]
    end

    def show
        song = FavoriteSong.find_by(id: params[:id])
        if song
            render json: song.slice(:id, :title, :artist, :video_url, :likes, :user, :comments)
        else 
            render json: { message: 'No song found with that id' }
        end 
    end

end