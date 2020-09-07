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

FavoriteSong.create(title: Faker::Music::PearlJam.song, artist: Faker::Music::RockBand.name, video_url: 'https://youtu.be/pZtx9ba_bWc', likes: 0, user_id: User.all.sample.id)
FavoriteSong.create(title: Faker::Music::PearlJam.song, artist: Faker::Music::RockBand.name, video_url: 'https://youtu.be/hs8y3kneqrs', likes: 0, user_id: User.all.sample.id)
FavoriteSong.create(title: Faker::Music::PearlJam.song, artist: Faker::Music::RockBand.name, video_url: 'https://youtu.be/PM_VIATPYQc', likes: 0, user_id: User.all.sample.id)

Comment.create(user_id: User.first.id, favorite_song_id: FavoriteSong.all.sample.id, content: "This song is amazing!")
Comment.create(user_id: User.second.id, favorite_song_id: FavoriteSong.all.sample.id, content: "Not the best :(")
Comment.create(user_id: User.third.id, favorite_song_id: FavoriteSong.all.sample.id, content: "Rock OUTTTTTTT")
Comment.create(user_id: User.third.id, favorite_song_id: FavoriteSong.all.sample.id, content: "Wow!")