class PagesController < ApplicationController
  def create
    @page = Page.create(
        title: params[:title],
        path: params[:path]
    )
    redirect_to show_page_path @page.path
  end

  def index
    show
  end

  def edit
    @page = Page.find(params[:id])
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
    redirect_to show_page_path(page.path)
  end

  def show
    @currentPage = Page.where(path: (params[:path] || '')).first || nil
    if @currentPage == nil
      redirect_to '/pages/add'
      return
    end
    @posts = @currentPage.posts || []
    render 'pages/index'
  end

end
