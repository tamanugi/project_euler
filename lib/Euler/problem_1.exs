defmodule Euler.Problem1 do
    @moduledoc """
    10未満の自然数のうち, 3 もしくは 5 の倍数になっているものは 3, 5, 6, 9 の4つがあり, これらの合計は 23 になる.
    同じようにして, 1000 未満の 3 か 5 の倍数になっている数字の合計を求めよ.
    """

    @limit 1000

    def solve do
        loop(0, 1)       
    end

    def loop(acc, num) when num < @limit do
        v = case {rem(num, 3), rem(num, 5)} do
            {0, _} -> num
            {_, 0} -> num
            _ -> 0
        end

        loop(acc + v, num + 1)
    end

    def loop(acc, _) do
        IO.puts acc
    end
end

Euler.Problem1.solve()