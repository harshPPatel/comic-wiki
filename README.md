# Comic Wiki

## DataSource Description:

As a part of this assignment, I have chosed database of comic books called: [Comic Vine](https://comicvine.gamespot.com/api/). It is a JSON API which returns data of different Comic Books. It requires API Key to make queries to their servers. To prevent this Key to go out public via GitHub, I will use .env file to hide it from tools.

During the seeding my local database, I will pull information from their API and I will add these data to my own database. Because of this step, It will let me make CRUD functionalities without need to worry about affecting original data.

This API has many different kind of ways to access comics. For this project, I am going with Volumes. It means that, I will fetch comics by some chosed volumes and I will add comics associated with it to the database. Once I have all the issues in Volume, I will make more requests to get characters and other information.

So far I have plans to create following tables with following columns. **Please note that this is not a final database structure because more I will play with API, I will learn more about how to fetch more related data.**

_This list does not includes the basic primary keys._

* Volume Table (Columns: Name, Description, Start Year, Site Detail URL, ImageID(FK))
* Issue Table (Columns: Name, Description, Site Detail URL, Image ID(FK), Volume ID (FK))
* Character (Columns: Name, Description, Site Detail URL, Image ID (FK))
* CharacterIssue (Columns: character_id (FK), issue_id (FK))
* Image (Columns: image_url)