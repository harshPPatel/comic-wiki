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

vol_list = ComicVine::API.get_list(:volumes, limit: 200)

# Looping through all volumes and fecthing more data
for volume in vol_list.cvos do
  # fetching data of individual volume
  volume_result = ComicVine::API.get_details_by_url(volume.api_detail_url)
  # Creating Volume in Database
  db_volume = Volume.create(name: volume_result.name,
                            description: volume_result.description,
                            start_year: volume_result.start_year,
                            site_detail_url: volume_result.site_detail_url,
                            image_url: volume_result.image["original_url"] )
  # Looping through Issues in volume
  for issue in volume_result.issues do
    # fetching data of individual issue
    issue_result = ComicVine::API.get_details_by_url(issue.api_detail_url)
    # Create issue locally in database
    db_issue = db_volume.issues.create(name: issue_result.name,
                            description: issue_result.description,
                            site_detail_url: issue_result.site_detail_url,
                            image_url: issue_result.image["original_url"] )
    # Looping through characters in issue
    for character in issue_result.character_credits do
      # fetching more details for character
      character_result = ComicVine::API.get_details_by_url(character.api_detail_url)
      # Creating Character in local Database
      db_character = db_issue.characters.create_with( description: character_result.description,
                                          site_detail_url: character_result.site_detail_url,
                                          image_url: character_result.image["original_url"] )
                    .find_or_create_by(name: character_result.name)
    end
  end
end

puts "Fetched All Data from ComicVine API 🎉."
