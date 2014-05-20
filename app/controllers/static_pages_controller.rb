class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      @feed_markers = Gmaps4rails.build_markers(@feed_items) do | feed_item, marker|
        marker.lat feed_item.latitude
        marker.lng feed_item.longitude
        marker.json({:id => feed_item.id})
        marker.infowindow (feed_item.user.name + ': ' + feed_item.content)
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end

end
