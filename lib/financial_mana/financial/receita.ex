defmodule FinancialMana.Financial.Receita do
  use Ecto.Schema
  import Ecto.Changeset

  schema "receitas" do
    field :name, :string
    field :value, :integer

    timestamps()
  end

  @doc false
  def changeset(receita, attrs) do
    receita
    |> cast(attrs, [:name, :value])
    |> validate_required([:name, :value])
  end
end
