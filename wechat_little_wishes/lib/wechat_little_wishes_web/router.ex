defmodule WechatLittleWishesWeb.Router do
  use WechatLittleWishesWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WechatLittleWishesWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", WechatLittleWishesWeb do
    pipe_through :api

    # validate wechat server config
    get "/", WechatController, :index

    # receive wechat push message
    post "/", WechatController, :create
  end
end
