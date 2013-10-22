AnimatedgifMe::Application.routes.draw do
  resources :gifs do
    collection do
      get "tagged/:tag", action: :tagged, as: :tagged
    end
  end

  get "/:tag", to: "gifs#random"

  root to: "gifs#index"
end
