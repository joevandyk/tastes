defmodule Tastes.UserView do
  use Tastes.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, Tastes.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, Tastes.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email_address: user.email_address,
      site_id: user.site_id,
      tastes: user.tastes}
  end
end
