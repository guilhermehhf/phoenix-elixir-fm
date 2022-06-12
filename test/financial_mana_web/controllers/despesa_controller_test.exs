defmodule FinancialManaWeb.DespesaControllerTest do
  use FinancialManaWeb.ConnCase

  import FinancialMana.FinancialFixtures

  @create_attrs %{name: "some name", value: 42}
  @update_attrs %{name: "some updated name", value: 43}
  @invalid_attrs %{name: nil, value: nil}

  describe "index" do
    test "lists all despesas", %{conn: conn} do
      conn = get(conn, Routes.despesa_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Despesas"
    end
  end

  describe "new despesa" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.despesa_path(conn, :new))
      assert html_response(conn, 200) =~ "New Despesa"
    end
  end

  describe "create despesa" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.despesa_path(conn, :create), despesa: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.despesa_path(conn, :show, id)

      conn = get(conn, Routes.despesa_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Despesa"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.despesa_path(conn, :create), despesa: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Despesa"
    end
  end

  describe "edit despesa" do
    setup [:create_despesa]

    test "renders form for editing chosen despesa", %{conn: conn, despesa: despesa} do
      conn = get(conn, Routes.despesa_path(conn, :edit, despesa))
      assert html_response(conn, 200) =~ "Edit Despesa"
    end
  end

  describe "update despesa" do
    setup [:create_despesa]

    test "redirects when data is valid", %{conn: conn, despesa: despesa} do
      conn = put(conn, Routes.despesa_path(conn, :update, despesa), despesa: @update_attrs)
      assert redirected_to(conn) == Routes.despesa_path(conn, :show, despesa)

      conn = get(conn, Routes.despesa_path(conn, :show, despesa))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, despesa: despesa} do
      conn = put(conn, Routes.despesa_path(conn, :update, despesa), despesa: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Despesa"
    end
  end

  describe "delete despesa" do
    setup [:create_despesa]

    test "deletes chosen despesa", %{conn: conn, despesa: despesa} do
      conn = delete(conn, Routes.despesa_path(conn, :delete, despesa))
      assert redirected_to(conn) == Routes.despesa_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.despesa_path(conn, :show, despesa))
      end
    end
  end

  defp create_despesa(_) do
    despesa = despesa_fixture()
    %{despesa: despesa}
  end
end
