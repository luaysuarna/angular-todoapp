class ApiController < ApplicationController

  skip_before_action :verify_authenticity_token
  before_action :set_default_format

  def success_api(message = "", data = {}, respond = 200)
    { message: message, respond: respond, success: true }.merge(data)
  end

  def failed_api(message = "", data = {}, respond = 200)
    { message: message, respond: respond, success: false }.merge(data)
  end

  private

    def set_default_format
      request.format = :json
    end

end
