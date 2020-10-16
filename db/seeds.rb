# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ComicVine'
require 'pp'

ComicVine::API.api_key = ENV['CV_API_KEY']

# vol_list = ComicVine::API.get_list(:volumes, limit: 50)

vol_list = ComicVine::API.get_details_by_url('https://comicvine.gamespot.com/api/volume/4050-978/')
# vol_list = ComicVine::API.get_details_by_url('https://comicvine.gamespot.com/api/issue/4000-241330/')
# vol_list = ComicVine::API.get_details_by_url('https://comicvine.gamespot.com/api/character/4005-9236/')

pp vol_list
