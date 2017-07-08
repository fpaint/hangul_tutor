require 'react-rails'

module HangulTutor
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def index      
    end

    def word
      render json: Word.get_random.json
    end

  end
end
