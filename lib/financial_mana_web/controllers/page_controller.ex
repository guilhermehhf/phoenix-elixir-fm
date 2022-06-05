defmodule FinancialManaWeb.PageController do
  use FinancialManaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
