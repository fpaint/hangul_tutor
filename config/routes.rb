HangulTutor::Engine.routes.draw do

  root 'application#index'
  get 'word' => 'application#word'

end
