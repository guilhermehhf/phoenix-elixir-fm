defmodule FinancialMana.Financial.Despesa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesas" do
    field :name, :string
    field :value, :integer
    belongs_to :user, Account.User
    timestamps()
  end

  @doc false
  def changeset(despesa, attrs) do
    despesa
    |> cast(attrs, [:user_id, :name, :value])
    |> validate_required([:user_id,:name, :value])
  end
end
