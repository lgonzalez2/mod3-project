
class FavoriteSongsController < ApplicationController

    def index
        favorite_songs = FavoriteSong.all
        render json: favorite_songs, only: [:id, :title, :artist, :video_url, :likes, :user_id], include: [:user, :comments]
    end

    def show
        song = FavoriteSong.find_by(id: params[:id])
        if song
            render json: song.slice(:id, :title, :artist, :video_url, :likes, :user, :comments)
        else 
            render json: { message: 'No song found with that id' }
        end 
    end

    def create 
        new_song = FavoriteSong.create(title: params[:title], artist: params[:artist], video_url: params[:video_url], likes: params[:likes], user_id: params[:user_id])

        render json: new_song, only: [:id, :title, :artist, :video_url, :likes, :user_id]
    end

    def update
        song = FavoriteSong.find(params[:id])
        song.update(like_params);
    end

    private

    def like_params
        params.permit(:likes)
    end

end