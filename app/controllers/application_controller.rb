class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  before_filter :store_location

  def after_sign_in_path_for(resource)
    return_to = session[:return_to]
    clear_stored_location
    return_to || root_path
  end

  protected

  # Store last url for post-login redirect to whatever the user last visited.
  # From: https://github.com/plataformatec/devise/wiki/How-To:-Redirect-back-to-current-page-after-sign-in,-sign-out,-sign-up,-update
  def store_location
    if (request.fullpath != "/users/sign_in" &&
        request.fullpath != "/users/sign_up" &&
        request.fullpath != "/users/password" &&
        request.fullpath != "/users/sign_out" &&
        !request.xhr? && # don't store ajax calls
        (request.format == "text/html" || request.content_type == "text/html"))
      session[:return_to] = request.fullpath
      # session[:last_request_time] = Time.now.utc.to_i
    end
  end

  def clear_stored_location
    session[:return_to] = nil
  end

  # def redirect_back_or_to(alternate)
  #   redirect_to(session[:return_to] || alternate)
  #   clear_stored_location
  # end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :username
    devise_parameter_sanitizer.for(:account_update) << :name
    devise_parameter_sanitizer.for(:sign_up) << :username
    devise_parameter_sanitizer.for(:sign_up) << :name
  end
end
