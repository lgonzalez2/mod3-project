# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
7.times do
User.create(username: Faker::GreekPhilosophers.name)
end

# video_url needs to be in this format to currently work: "https://www.youtube.com/embed/9cN1XCpfWD4"
FavoriteSong.create(title: "Hey You", artist: "Pink Floyd", video_url: "https://www.youtube.com/embed/TFjmvfRvjTc", likes: 3, user_id: 3)
FavoriteSong.create(title: "Stairway to Heaven", artist: "Led Zeppelin", video_url: "https://www.youtube.com/embed/xbhCPt6PZIU", likes: 0, user_id: 2)
FavoriteSong.create(title: "Sunset", artist: "The Midnight", video_url: "https://www.youtube.com/embed/rEzSMLEJWx8", likes: 10, user_id: 5)
FavoriteSong.create(title: "Maria Tambien", artist: "Kraungbin", video_url: "https://www.youtube.com/embed/9cN1XCpfWD4", likes: 5, user_id: 3)
FavoriteSong.create(title: "High Hopes", artist: "Pink Floyd", video_url: "https://www.youtube.com/embed/BGBM5vWiBLo", likes: 2, user_id: 2)
FavoriteSong.create(title: "Serial Killer", artist: "Lana Del Rey", video_url: "https://www.youtube.com/embed/tNRR_JfLmoI", likes: 8, user_id: 3)
FavoriteSong.create(title: "Drive Home", artist: "Steven Wilson", video_url: "https://www.youtube.com/embed/FR4-zgLIJvI", likes: 14, user_id: 6)




Comment.create(user_id: 1, favorite_song_id: FavoriteSong.all.sample.id, content: "This song is amazing!")
Comment.create(user_id: 2, favorite_song_id: FavoriteSong.all.sample.id, content: "Not the best :(")
Comment.create(user_id: 3, favorite_song_id: FavoriteSong.all.sample.id, content: "Rock OUTTTTTTT")
Comment.create(user_id: 4, favorite_song_id: FavoriteSong.all.sample.id, content: "Love this!")
Comment.create(user_id: 4, favorite_song_id: FavoriteSong.all.sample.id, content: "Cool")
Comment.create(user_id: 4, favorite_song_id: FavoriteSong.all.sample.id, content: "Niceeeeeeeeee!")
Comment.create(user_id: 4, favorite_song_id: FavoriteSong.all.sample.id, content: "Nice vibes")
Comment.create(user_id: 4, favorite_song_id: FavoriteSong.all.sample.id, content: "Wow!")