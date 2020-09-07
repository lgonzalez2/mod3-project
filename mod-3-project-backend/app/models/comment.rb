class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :favorite_song
  
end
