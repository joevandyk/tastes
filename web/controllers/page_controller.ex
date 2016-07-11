defmodule Tastes.PageController do
  use Tastes.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
