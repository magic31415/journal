# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :journal,
  ecto_repos: [Journal.Repo],
  code: ""

# Configures the endpoint
config :journal, JournalWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "YgnZFvC9Qi7W6j/9DGu1l/qDCdSkDnRUE3MqmBPmeYTw2MrZ7cTsSD8V4irS4VMh",
  render_errors: [view: JournalWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Journal.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :textex,
  sends_username: "max",
  password: "ushie2Ea2n",
  base_sends_uri: "https://app.grouptexting.com/api", # optional; uses the eztexting API url by default
  mode: :production # optional; specifying :test will not make any actual API calls

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
