defmodule Euler.Problem2 do
    @moduledoc """
    フィボナッチ数列の項は前の2つの項の和である. 最初の2項を 1, 2 とすれば, 最初の10項は以下の通りである.

    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...
    数列の項の値が400万以下の, 偶数値の項の総和を求めよ.
    """

    @limit 400_0000

    def solve do
      Memorize.start_agent
      gen_fib(1)
      |> Enum.filter(fn v -> rem(v, 2) == 0 end)
      |> Enum.sum
      |> IO.inspect
    end

    def gen_fib(n) do
      case Memorize.fib(n) > @limit do
        true -> Memorize.gen_fib([], n - 1)
        _ -> gen_fib(n + 1)
      end
    end

end


defmodule Memorize do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n) do
    case Agent.get(:fib_memo, &Map.get(&1, n)) do
      nil ->
        v = fib(n - 1) + fib(n - 2)
        Agent.update(:fib_memo, &Map.put(&1, n, v))
        v
      v -> v
    end
  end

  def gen_fib(acc, 1) do
    acc
  end

  def gen_fib(acc, n) do
    gen_fib([fib(n) | acc], n - 1)
  end

  def start_agent do
    Agent.start_link &Map.new/0, name: :fib_memo
  end
end

Euler.Problem2.solve()