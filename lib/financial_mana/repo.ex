defmodule FinancialMana.Repo do
  use Ecto.Repo,
    otp_app: :financial_mana,
    adapter: Ecto.Adapters.Postgres
end
