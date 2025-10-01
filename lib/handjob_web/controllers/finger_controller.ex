defmodule HandjobWeb.FingerController do
  use HandjobWeb, :controller

  alias Circuits.GPIO

  @step_pin Application.compile_env(:handjob_web, :step_pin, "GPIO15")
  @dir_pin Application.compile_env(:handjob_web, :dir_pin, "GPIO14")

  def bang(conn, _params) do
    with {:ok, dir} <- GPIO.open(@dir_pin, :output),
         {:ok, step} <- GPIO.open(@step_pin, :output),
         :ok <-
           0..1
           |> Enum.each(fn i ->
             GPIO.write(dir, i)
             rotate(step)
           end) do
      conn
      |> put_status(:created)
      |> json(%{finger: "banged"})
    end
  end

  defp rotate(step) do
    1..50
    |> Enum.each(fn _ ->
      1..0//-1
      |> Enum.each(fn i ->
        GPIO.write(step, i)
        Process.sleep(1)
      end)
    end)
  end
end
