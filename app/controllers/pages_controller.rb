class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update, :destroy, :show, :index]
  load_and_authorize_resource
  def create
    @page = Page.create(
        title: params[:title],
        path: params[:path]
    )
    redirect_to page_path @page.path
  end

  def index
    show
  end

  def edit
    params[:path] = @page.path
  end

  def destroy
    page = Page.find(params[:id])
    page.posts.destroy_all
    page.destroy
    redirect_to root_path
  end

  def update
    page = Page.find(params[:id])
    page.title = params[:title]
    page.path = params[:path]
    page.save
    redirect_to page_path(page.path)
  end

  def show
    #@currentPage = Page.where(path: (params[:path] || '')).first || nil
    if @page == nil && user_signed_in?
      redirect_to '/pages/add'
      return
    elsif !user_signed_in? && @page == nil
      redirect_to '/'
      return
    end
    @posts = @page.posts.order_by(:created_at.desc) || []
    render 'pages/index'
  end

  private

  def set_page
    #Page.find_or_create_by(path: '')
    @page = Page.where(path: (params[:id] || '')).first || Page.find(params[:id])
  end

end
