# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
3.times do
User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::GreekPhilosophers.name)
end

# video_url needs to be in this format to currently work: "https://www.youtube.com/embed/9cN1XCpfWD4"
FavoriteSong.create(title: "Hey You", artist: "Pink Floyd", video_url: "https://www.youtube.com/embed/TFjmvfRvjTc", likes: 3, user_id: 3)
FavoriteSong.create(title: "Stairway to Heaven", artist: "Led Zeppelin", video_url: "https://www.youtube.com/embed/xbhCPt6PZIU", likes: 0, user_id: 2)
FavoriteSong.create(title: "Shadows", artist: "The Midnight", video_url: "https://www.youtube.com/embed/sGwtkJaQ9n0", likes: 10, user_id: 1)
FavoriteSong.create(title: "Maria Tambien", artist: "Kraungbin", video_url: "https://www.youtube.com/embed/9cN1XCpfWD4", likes: 5, user_id: 2)

Comment.create(user_id: User.first.id, favorite_song_id: FavoriteSong.all.sample.id, content: "This song is amazing!")
Comment.create(user_id: User.second.id, favorite_song_id: FavoriteSong.all.sample.id, content: "Not the best :(")
Comment.create(user_id: User.third.id, favorite_song_id: FavoriteSong.all.sample.id, content: "Rock OUTTTTTTT")
Comment.create(user_id: User.third.id, favorite_song_id: FavoriteSong.all.sample.id, content: "Wow!")