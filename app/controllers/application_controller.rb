class ApplicationController < ActionController::Base

  before_action :set_header
  protect_from_forgery with: :exception

  private

    def set_header
      response.header['Access-Control-Allow-Origin'] = 'http://localhost:8080'
      response.header['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE'
      response.header['Access-Control-Allow-Headers'] = 'Accept, X-Requested-With'
      response.header['Access-Control-Allow-Credentials'] = true
    end
end
