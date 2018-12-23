defmodule ListOps do
  # Please don't use any external modules (especially List or Enum) in your
  # implementation. The point of this exercise is to create these basic
  # functions yourself. You may use basic Kernel functions (like `Kernel.+/2`
  # for adding numbers), but please do not use Kernel functions for Lists like
  # `++`, `--`, `hd`, `tl`, `in`, and `length`.

  @spec count(list) :: non_neg_integer
  def count(l), do: reduce(l, 0, fn _x, counter -> counter + 1 end)

  @spec reverse(list) :: list
  def reverse(l), do: reduce(l, [], fn x, acc -> [x | acc] end)

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    reduce(l, [], fn x, acc -> [f.(x) | acc] end) |> reverse
  end

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(l, [], fn x, acc ->
      if f.(x) do
        [x | acc]
      else acc end
    end)
    |> reverse
  end

  @type acc :: any
  @spec reduce(list, acc, (any, acc -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  defp append_rec([], b), do: b
  defp append_rec([head | tail], b), do: append_rec(tail, [head | b])
  def append(a, b), do: append_rec(reverse(a), b)

  @spec concat([[any]]) :: [any]
  def concat([]), do: []
  def concat([head | tail]), do: append(head, concat(tail))
end
