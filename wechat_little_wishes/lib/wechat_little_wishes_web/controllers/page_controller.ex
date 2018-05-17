defmodule WechatLittleWishesWeb.PageController do
  use WechatLittleWishesWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
