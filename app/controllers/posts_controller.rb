class PostsController < ApplicationController
  before_action :set_post, :only => [:show, :edit, :update, :create]
  load_and_authorize_resource
  def show
    @post = Post.find(params[:id])
    @current_page = Page.find_by(path: params[:path] || '')
  end

  def create
    @post = @page.posts << Post.new(
        title: params[:title],
        show_date: params[:show_date] == 'true',
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
    post.show_date = params[:show_date] == 'true'
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
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    if params[:page_id] != nil
      @page = Page.find(params[:page_id])
    end
    if params[:id] != nil
      @post = Post.find(params[:id])
    end

  end

end
