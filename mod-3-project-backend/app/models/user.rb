class User < ApplicationRecord

    has_many :comments
    has_many :favorite_songs

end
