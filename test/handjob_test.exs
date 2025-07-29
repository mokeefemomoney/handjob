defmodule HandjobTest do
  use ExUnit.Case
  doctest Handjob

  test "greets the world" do
    assert Handjob.hello() == :world
  end
end
