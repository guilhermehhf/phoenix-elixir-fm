defmodule FinancialMana.FinancialTest do
  use FinancialMana.DataCase

  alias FinancialMana.Financial

  describe "receitas" do
    alias FinancialMana.Financial.Receita

    import FinancialMana.FinancialFixtures

    @invalid_attrs %{name: nil, value: nil}

    test "list_receitas/0 returns all receitas" do
      receita = receita_fixture()
      assert Financial.list_receitas() == [receita]
    end

    test "get_receita!/1 returns the receita with given id" do
      receita = receita_fixture()
      assert Financial.get_receita!(receita.id) == receita
    end

    test "create_receita/1 with valid data creates a receita" do
      valid_attrs = %{name: "some name", value: 42}

      assert {:ok, %Receita{} = receita} = Financial.create_receita(valid_attrs)
      assert receita.name == "some name"
      assert receita.value == 42
    end

    test "create_receita/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financial.create_receita(@invalid_attrs)
    end

    test "update_receita/2 with valid data updates the receita" do
      receita = receita_fixture()
      update_attrs = %{name: "some updated name", value: 43}

      assert {:ok, %Receita{} = receita} = Financial.update_receita(receita, update_attrs)
      assert receita.name == "some updated name"
      assert receita.value == 43
    end

    test "update_receita/2 with invalid data returns error changeset" do
      receita = receita_fixture()
      assert {:error, %Ecto.Changeset{}} = Financial.update_receita(receita, @invalid_attrs)
      assert receita == Financial.get_receita!(receita.id)
    end

    test "delete_receita/1 deletes the receita" do
      receita = receita_fixture()
      assert {:ok, %Receita{}} = Financial.delete_receita(receita)
      assert_raise Ecto.NoResultsError, fn -> Financial.get_receita!(receita.id) end
    end

    test "change_receita/1 returns a receita changeset" do
      receita = receita_fixture()
      assert %Ecto.Changeset{} = Financial.change_receita(receita)
    end
  end

  describe "despesas" do
    alias FinancialMana.Financial.Despesa

    import FinancialMana.FinancialFixtures

    @invalid_attrs %{name: nil, value: nil}

    test "list_despesas/0 returns all despesas" do
      despesa = despesa_fixture()
      assert Financial.list_despesas() == [despesa]
    end

    test "get_despesa!/1 returns the despesa with given id" do
      despesa = despesa_fixture()
      assert Financial.get_despesa!(despesa.id) == despesa
    end

    test "create_despesa/1 with valid data creates a despesa" do
      valid_attrs = %{name: "some name", value: 42}

      assert {:ok, %Despesa{} = despesa} = Financial.create_despesa(valid_attrs)
      assert despesa.name == "some name"
      assert despesa.value == 42
    end

    test "create_despesa/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Financial.create_despesa(@invalid_attrs)
    end

    test "update_despesa/2 with valid data updates the despesa" do
      despesa = despesa_fixture()
      update_attrs = %{name: "some updated name", value: 43}

      assert {:ok, %Despesa{} = despesa} = Financial.update_despesa(despesa, update_attrs)
      assert despesa.name == "some updated name"
      assert despesa.value == 43
    end

    test "update_despesa/2 with invalid data returns error changeset" do
      despesa = despesa_fixture()
      assert {:error, %Ecto.Changeset{}} = Financial.update_despesa(despesa, @invalid_attrs)
      assert despesa == Financial.get_despesa!(despesa.id)
    end

    test "delete_despesa/1 deletes the despesa" do
      despesa = despesa_fixture()
      assert {:ok, %Despesa{}} = Financial.delete_despesa(despesa)
      assert_raise Ecto.NoResultsError, fn -> Financial.get_despesa!(despesa.id) end
    end

    test "change_despesa/1 returns a despesa changeset" do
      despesa = despesa_fixture()
      assert %Ecto.Changeset{} = Financial.change_despesa(despesa)
    end
  end
end
