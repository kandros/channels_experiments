defmodule ChannelsExperiments.Web.Router do
  use ChannelsExperiments.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", ChannelsExperiments.Web do
    pipe_through :api
  end
end
