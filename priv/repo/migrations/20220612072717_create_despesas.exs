defmodule FinancialMana.Repo.Migrations.CreateDespesas do
  use Ecto.Migration

  def change do
    create table(:despesas) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :name, :string, null: false
      add :value, :integer, null: false

      timestamps()
    end
  end
end
