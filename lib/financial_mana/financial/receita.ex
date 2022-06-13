defmodule FinancialMana.Financial.Receita do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :name, :string
    field :value, :integer
    belongs_to :user, Account.User
    timestamps()
  end

  @doc false
  def changeset(receita, attrs) do
    receita
    |> cast(attrs, [:user_id,:name, :value])
    |> validate_required([:user_id,:name, :value])
  end
end
