class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_current_page

  def set_current_page
    if params[:page_id].nil?
      @current_page =  @page || Page.where(path: params[:path]).first
    elsif not params[:id].nil? and params[:page_id].nil?
      @current_page = Page.find(params[:id])
    else
      @current_page = Page.find(params[:page_id])
    end

  end
end
