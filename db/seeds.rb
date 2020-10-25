# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ComicVine'
require 'pp'
require 'faker'

ComicVine::API.api_key = ENV['CV_API_KEY']

vol_list = ComicVine::API.get_list(:volumes, limit: 20)

# Looping through all volumes and fecthing more data
for volume in vol_list.cvos do
  # fetching data of individual volume
  volume_result = ComicVine::API.get_details_by_url(volume.api_detail_url)

  # Creating Volume in Database
  db_volume = Volume.create_with( name: volume_result.name || Faker::Name.name,
                                  description: volume_result.description || Faker::Lorem.paragraph,
                                  start_year: volume_result.start_year || 1995,
                                  site_detail_url: volume_result.site_detail_url || 'https"//www.google.com',
                                  image_url: volume_result.image["original_url"] || 'https"//www.google.com' )
                    .find_or_create_by(id: volume.id)
  # Used to control iteration per volume entries
  iteration_count = 0
  # Looping through Issues in volume
  for issue in volume_result.issues do
    if (iteration_count < 50)
      iteration_count = iteration_count + 1;
      pp issue
      # fetching data of individual issue
      issue_result = ComicVine::API.get_details_by_url(issue.api_detail_url)
      begin
        # Create issue locally in database
        db_issue = db_volume.issues.create_with(name: issue_result.name || Faker::Name.name,
                                                description: issue_result.description || Faker::Lorem.paragraph,
                                                site_detail_url: issue_result.site_detail_url || 'https"//www.google.com',
                                                image_url: issue_result.image["original_url"] || 'https"//www.google.com' )
                            .find_or_create_by(id: issue.id)
      rescue => exception
        print(exception.message())
      end
      # Looping through characters in issue
      for character in issue_result.character_credits do
        if (iteration_count < 50)
          pp character
          iteration_count = iteration_count + 1;
          # fetching more details for character
          character_result = ComicVine::API.get_details_by_url(character.api_detail_url)
          begin
            # Creating Character in local Database
            db_character = db_issue.characters.create_with( name: character_result.name || Faker::Name.name,
                                                            description: character_result.description || Faker::Lorem.paragraph,
                                                            site_detail_url: character_result.site_detail_url || 'https"//www.google.com',
                                                            image_url: character_result.image["original_url"] || 'https"//www.google.com' )
                                    .find_or_create_by(id: character.id)
          rescue => exception
            print(exception.message())
          end
        end
      end
    end
  end
end

puts "Fetched All Data from ComicVine API 🎉."
