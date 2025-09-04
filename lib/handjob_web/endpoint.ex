defmodule HandjobWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :handjob

  # The session will be stored in the cookie and signed,
  # this means its contents can be read but not tampered with.
  # Set :encryption_salt if you would also like to encrypt it.
  @session_options [
    store: :cookie,
    key: "_handjob_key",
    signing_salt: "jtTHK+Go",
    same_site: "Lax"
  ]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head
  plug HandjobWeb.Router
end
