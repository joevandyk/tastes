defmodule Tastes.AnimalControllerTest do
  use Tastes.ConnCase

  alias Tastes.Animal
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, animal_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing animals"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, animal_path(conn, :new)
    assert html_response(conn, 200) =~ "New animal"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, animal_path(conn, :create), animal: @valid_attrs
    assert redirected_to(conn) == animal_path(conn, :index)
    assert Repo.get_by(Animal, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, animal_path(conn, :create), animal: @invalid_attrs
    assert html_response(conn, 200) =~ "New animal"
  end

  test "shows chosen resource", %{conn: conn} do
    animal = Repo.insert! %Animal{}
    conn = get conn, animal_path(conn, :show, animal)
    assert html_response(conn, 200) =~ "Show animal"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, animal_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    animal = Repo.insert! %Animal{}
    conn = get conn, animal_path(conn, :edit, animal)
    assert html_response(conn, 200) =~ "Edit animal"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    animal = Repo.insert! %Animal{}
    conn = put conn, animal_path(conn, :update, animal), animal: @valid_attrs
    assert redirected_to(conn) == animal_path(conn, :show, animal)
    assert Repo.get_by(Animal, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    animal = Repo.insert! %Animal{}
    conn = put conn, animal_path(conn, :update, animal), animal: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit animal"
  end

  test "deletes chosen resource", %{conn: conn} do
    animal = Repo.insert! %Animal{}
    conn = delete conn, animal_path(conn, :delete, animal)
    assert redirected_to(conn) == animal_path(conn, :index)
    refute Repo.get(Animal, animal.id)
  end
end
