defmodule HandjobWeb.Router do
  use HandjobWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HandjobWeb do
    pipe_through :api
  end
end
