defmodule Tastes.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    execute "create extension citext"
    create table(:users) do
      add :email_address, :citext
      add :site_id, :string
      add :tastes, :jsonb

      timestamps()
    end

  end
end
