class PostsController < ApplicationController
  def create
    page = Page.where(path: params[:path] || '').first
    @post = page.posts << Post.new(
        title: params[:title],
        body: params[:body]
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
