# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :channels_experiments, ChannelsExperiments.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9aJap6TkaYifLljrpAQYNEf+8Vwajx6IkehPsXyPz4cgutUBpmfl4Ro9YJzjsjra",
  render_errors: [view: ChannelsExperiments.Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: ChannelsExperiments.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
