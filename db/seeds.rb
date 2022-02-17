# require 'open-uri'
# require 'json'

puts 'Fetching data...'
url = 'http://tmdb.lewagon.com/movie/now_playing'
movies_serialized = URI.parse(url).open.read
movies = JSON.parse(movies_serialized)

# p movies['results'].size

puts 'Creating movies...'

movies['results'].each do |movie|
  # p movie['title']
  movie = Movie.create!(title: movie['title'],
                        overview: movie['overview'],
                        poster_url: movie['poster_path'],
                        rating: movie['vote_average'])
  puts "Created movie #{movie.title}"
end

puts 'Done!'
