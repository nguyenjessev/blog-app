class TagsController < ApplicationController
  before_action :require_login, only: [:destroy]

  def show
    @tag = Tag.find(params[:id])
  end

  def index
    @tags = Tag.all
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    flash.notice = "Tag '#{@tag.name}' deleted!"

    redirect_to tags_path
  end

  private

  def require_login
    unless logged_in?
      redirect_to root_path
      return false
    end
  end
end
