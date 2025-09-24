defmodule HandjobWeb.FingerController do
  use HandjobWeb, :controller

  alias Circuits.GPIO

  @step_pin Application.compile_env(:handjob_web, :step_pin, "GPIO15")
  @dir_pin Application.compile_env(:handjob_web, :dir_pin, "GPIO14")
  @enable_pin Application.compile_env(:handjob_web, :enable_pin, "GPIO18")

  def bang(conn, _params) do
    {:ok, enable} = GPIO.open(@enable_pin, :output)
    GPIO.write(enable, 0)

    {:ok, direction} = GPIO.open(@dir_pin, :output)

    {:ok, step} = GPIO.open(@step_pin, :output)

    GPIO.write(direction, 0)

    1..100
    |> Enum.each(fn _ ->
      GPIO.write(step, 1)
      Process.sleep(1)
      GPIO.write(step, 0)
    end)

    GPIO.write(direction, 1)

    1..100
    |> Enum.each(fn _ ->
      GPIO.write(step, 1)
      Process.sleep(1)
      GPIO.write(step, 0)
    end)

    GPIO.write(enable, 1)

    json(conn, %{finger: "banged"})
  end
end
