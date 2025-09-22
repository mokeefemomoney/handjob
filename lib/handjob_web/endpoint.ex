defmodule HandjobWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :handjob

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.MethodOverride)
  plug(Plug.Head)
  plug(HandjobWeb.Router)
end
