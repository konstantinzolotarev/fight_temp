# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :server,
  namespace: Server,
  ecto_repos: [Server.Repo]

# Configures the endpoint
config :server, Server.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AJ3HW3lOg/9n1Dj2i1BeXredjxgm9pjiWus/zEMbckXULuvMiwdHqiLuM4pQocET",
  render_errors: [view: Server.Web.ErrorView, accepts: ~w(json)],
  pubsub: [name: Server.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Fight.Server",
  ttl: { 30, :days },
  allowed_drift: 2000,
  verify_issuer: true, # optional
  secret_key: "super-secret-key",
  serializer: Server.GuardianSerializer

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
