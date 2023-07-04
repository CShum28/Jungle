before_action :authenticate

def authenticate
  authenticate_or_request_with_http_basic do |username, password|
    # Check the provided username and password for validity
    # You can use any authentication mechanism here (e.g., comparing against stored credentials)
    username == 'admin' && password == 'password'
  end
end

class Admin::DashboardController < ApplicationController
  def show
  end
end
