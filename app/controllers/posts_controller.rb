class PostsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @post = Post.find(params[:id])
    @currentPage = Page.find_by(path: params[:path] || '')
  end

  def create
    page = Page.where(path: params[:path] || '').first
    @post = page.posts << Post.new(
        title: params[:title],
        show_date: params[:show_date],
        body: params[:body],
        user: current_user
    )
    respond_to do |format|
      format.json {
        render :json => @post.as_json
      }
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.title = params[:title]
    post.body = params[:body]
    post.show_date = params[:show_date]
    post.save
    respond_to do |format|
      format.json {
        render :json => post
      }
    end

  end

  def destroy
    post = Post.find(params[:id]).destroy

    puts 'POST: '+ params[:id]
    redirect_to '/'
  end
end
