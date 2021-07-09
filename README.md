# README

Basic Ruby on Rails: Top Score Ranking
This API is to be used to manage scores for a certain game for a group of player.
Before running the app enter the following commands to install gems and set up and  initialize the database (You only need to do this before running the app for the first time:
~~_****_~~
bundle install

Now you are ready to try out the app. Enter the following command to start the rails server:

bin/rails server
After the server has started, you should see a small window that says:

“Listening on <some URL ending in C9>”
You can use the URL to use access the API functions
When you are done using the app, you can kill the rails server by typing:
Ctrl-c


All API functions are listed in the following.
You can also use postman collection "score_ranking.postman_collection.json" located in the projject folder.
-------------------------------------------------------
▪Get Score by id
{{BASE_URL}}/scores/score-by-id/{score-id}
▪Delete Score
    {{BASE_URL}}/scores/delete-score/{score-id}
▪Insert Score
    {{BASE_URL}}/scores/insert-score
    Input data formmat
    {
        "players":
        {
            "player_name": "Test1",
            "score": 15,
            "score_time": "2021-12-11"
        }
    }
▪Score list by filter
    {{BASE_URL}}/scores/score-list
    Input data formmat
    {
        "filters":
        {
            "page": 1,
            "limit": 2,
            "dateFrom": "2021-12-11 11:21:11",
            "dateTo": "2021-12-12 11:21:11",
            "players": ["chan myae aung"]
        }
    }

▪Player History
    {{BASE_URL}}/scores/player-history
    Input data formmat
    {
        "player": "chan myae aung"
    }

To run Rspec unit test run the following command
rspec spec/models/score_spec.rb
