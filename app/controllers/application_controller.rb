class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_hacker, :logged_in?

  private

  def current_hacker
    @current_hacker ||= Hacker.find(session[:hacker_id]) if session[:hacker_id]
  end

  def logged_in?
    !!current_hacker
  end
end
