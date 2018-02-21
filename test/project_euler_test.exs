defmodule ProjectEulerTest do
  use ExUnit.Case
  doctest ProjectEuler

  test "greets the world" do
    assert ProjectEuler.hello() == :world
  end
end
