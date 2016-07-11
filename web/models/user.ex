defmodule Tastes.User do
  use Tastes.Web, :model

  schema "users" do
    field :email_address, :string
    field :site_id, :string
    field :tastes, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email_address, :site_id, :tastes])
    |> validate_required([:email_address, :site_id, :tastes])
  end
end
