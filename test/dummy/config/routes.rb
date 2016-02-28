Rails.application.routes.draw do
  post 'main/action_a'

  post 'main/action_b'

  post 'main/action_c'

  post 'complex/action'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
