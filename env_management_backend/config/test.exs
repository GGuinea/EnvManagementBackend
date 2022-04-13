import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :env_management_backend, EnvManagementBackend.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "env_management_backend_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :env_management_backend, EnvManagementBackendWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "mFY0s0R4oB6AEw3dBf2LBz5ftcQuASKLC5Edeo1LlBbDorwZFQKeRlzwEHiDjrpl",
  server: false

# In test we don't send emails.
config :env_management_backend, EnvManagementBackend.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
