Rails.application.routes.draw do
  root'users#index'
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show]
end
get 'users/:author_id/posts/:id/comments/new' => 'comments#new', as: "comments_new"
post 'users/:author_id/posts/:id/comments' => 'comments#create', as: "comment"

# will match a GET request to the given URL and send it to the create action in the LikesController.
get 'users/:author_id/posts/:id/likes/new' => 'likes#create', as: "likes_create"

end
