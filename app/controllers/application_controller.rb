class ApplicationController < ActionController::Base
  before_action :authenticate

  private
    def authenticate
      return true if Rails.env.development? # only authenticate in production
      authenticate_or_request_with_http_basic do |username, password|
        username == "launchpad" && password == ENV["LAUNCHPAD_LICENSE_KEY"]
      end
    end  
end