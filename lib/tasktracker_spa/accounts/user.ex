defmodule TasktrackerSpa.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    pass = Map.get(attrs, "password")
    IO.puts pass
    password_hash = Comeonin.Argon2.hashpwsalt(pass)
    attrs = Map.put(attrs, "password_hash", password_hash)

    user
    |> cast(attrs, [:email, :name, :password_hash])
    |> validate_required([:email, :name, :password_hash])
    |> unique_constraint(:email)
  end
end
