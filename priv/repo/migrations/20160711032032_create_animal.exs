defmodule Tastes.Repo.Migrations.CreateAnimal do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :name, :string

      timestamps()
    end

  end
end
