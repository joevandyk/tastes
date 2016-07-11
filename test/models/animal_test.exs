defmodule Tastes.AnimalTest do
  use Tastes.ModelCase

  alias Tastes.Animal

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Animal.changeset(%Animal{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Animal.changeset(%Animal{}, @invalid_attrs)
    refute changeset.valid?
  end
end
