defmodule FinancialMana.Financial.Despesa do
  use Ecto.Schema
  import Ecto.Changeset

  schema "despesas" do
    field :name, :string
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(despesa, attrs) do
    despesa
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end
