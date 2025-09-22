defmodule HandjobWeb.FingerController do
  use HandjobWeb, :controller

  def bang(conn, _params) do
    # GPIO Stuff

    json(conn, %{finger: "banged"})
  end
end
