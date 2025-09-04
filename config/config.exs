# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

################################################################
## Phoenix Config
################################################################

# Configures the endpoint
config :handjob, HandjobWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: HandjobWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Handjob.PubSub


# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

################################################################
## Nerves Config
################################################################

Application.start(:nerves_bootstrap)

config :handjob, target: Mix.target()

# Customize non-Elixir parts of the firmware. See
# https://hexdocs.pm/nerves/advanced-configuration.html for details.

config :nerves, :firmware, rootfs_overlay: "rootfs_overlay"

# Set the SOURCE_DATE_EPOCH date for reproducible builds.
# See https://reproducible-builds.org/docs/source-date-epoch/ for more information

config :nerves, source_date_epoch: "1753792138"

################################################################
## Common Config
################################################################

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

if Mix.target() == :host do
  import_config "host.exs"
else
  import_config "target.exs"
end
