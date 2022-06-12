defmodule FinancialMana.FinancialFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FinancialMana.Financial` context.
  """

  @doc """
  Generate a receita.
  """
  def receita_fixture(attrs \\ %{}) do
    {:ok, receita} =
      attrs
      |> Enum.into(%{
        name: "some name",
        value: 42
      })
      |> FinancialMana.Financial.create_receita()

    receita
  end

  @doc """
  Generate a despesa.
  """
  def despesa_fixture(attrs \\ %{}) do
    {:ok, despesa} =
      attrs
      |> Enum.into(%{
        name: "some name",
        value: 42
      })
      |> FinancialMana.Financial.create_despesa()

    despesa
  end
end
