defmodule FinancialManaWeb.ReceitaControllerTest do
  use FinancialManaWeb.ConnCase

  import FinancialMana.FinancialFixtures

  @create_attrs %{name: "some name", value: 42}
  @update_attrs %{name: "some updated name", value: 43}
  @invalid_attrs %{name: nil, value: nil}

  describe "index" do
    test "lists all receitas", %{conn: conn} do
      conn = get(conn, Routes.receita_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Receitas"
    end
  end

  describe "new receita" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.receita_path(conn, :new))
      assert html_response(conn, 200) =~ "New Receita"
    end
  end

  describe "create receita" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.receita_path(conn, :create), receita: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.receita_path(conn, :show, id)

      conn = get(conn, Routes.receita_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Receita"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.receita_path(conn, :create), receita: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Receita"
    end
  end

  describe "edit receita" do
    setup [:create_receita]

    test "renders form for editing chosen receita", %{conn: conn, receita: receita} do
      conn = get(conn, Routes.receita_path(conn, :edit, receita))
      assert html_response(conn, 200) =~ "Edit Receita"
    end
  end

  describe "update receita" do
    setup [:create_receita]

    test "redirects when data is valid", %{conn: conn, receita: receita} do
      conn = put(conn, Routes.receita_path(conn, :update, receita), receita: @update_attrs)
      assert redirected_to(conn) == Routes.receita_path(conn, :show, receita)

      conn = get(conn, Routes.receita_path(conn, :show, receita))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, receita: receita} do
      conn = put(conn, Routes.receita_path(conn, :update, receita), receita: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Receita"
    end
  end

  describe "delete receita" do
    setup [:create_receita]

    test "deletes chosen receita", %{conn: conn, receita: receita} do
      conn = delete(conn, Routes.receita_path(conn, :delete, receita))
      assert redirected_to(conn) == Routes.receita_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.receita_path(conn, :show, receita))
      end
    end
  end

  defp create_receita(_) do
    receita = receita_fixture()
    %{receita: receita}
  end
end
