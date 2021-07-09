Rails.application.routes.draw do
  root 'scores#index'
  get '/scores', to: "scores#index"
  get '/scores/score-by-id/:id', to: "scores#score_by_id"
  post '/scores/player-history', to: "scores#player_history"
  get '/scores/index', to: "scores#index"
  post '/scores/insert-score'
  delete '/scores/delete-score/:id', to: "scores#delete_score"
  post '/scores/score-list', to: "scores#score_list"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
