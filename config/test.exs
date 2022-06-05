import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :pbkdf2_elixir, :rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :financial_mana, FinancialMana.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "financial_mana_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :financial_mana, FinancialManaWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "/YmpEg9BZIbfSsa/uq6Q6oJDeC9y4Nlb3oSDI46TvgjxPgakqtDGiLmeOyLA5qPT",
  server: false

# In test we don't send emails.
config :financial_mana, FinancialMana.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
