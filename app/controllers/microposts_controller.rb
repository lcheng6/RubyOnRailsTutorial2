class MicropostsController < ApplicationController
  #before_action :set_micropost, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user,  only: [:create, :destroy]
  before_action :correct_user,    only: :destroy
  before_action :show_single_micropost_if_correct_user,   only: :show

  def index

  end

  def show

  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to root_url
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def show_single_micropost_if_correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      flash[:error] = "Only correct user can see that micropost" if @micropost.nil?
      redirect_to root_url if @micropost.nil?
    end
end
