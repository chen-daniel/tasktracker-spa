defmodule TasktrackerSpaWeb.TokenController do
  use TasktrackerSpaWeb, :controller
  alias TasktrackerSpa.Accounts.User

  action_fallback TasktrackerSpaWeb.FallbackController

  def create(conn, %{"email" => email, "pass" => pass}) do
    with {:ok, %User{} = user} <- TasktrackerSpa.Accounts.get_and_auth_user(email, pass) do
      token = Phoenix.Token.sign(conn, "auth token", user.id)
      conn
      |> put_status(:created)
      |> render("token.json", user: user, token: token)
    end
  end
end
