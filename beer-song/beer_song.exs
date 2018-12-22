defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{bottles_on_the_wall(number)}
    #{go_for_bottles(number)}
    """
  end

  defp bottles_on_the_wall(number) do
    "#{String.capitalize(bottles(number))} of beer on the wall, #{bottles(number)} of beer."
  end

  defp bottles(1) do
    "1 bottle"
  end

  defp bottles(0) do
    "no more bottles"
  end

  defp bottles(number) do
    "#{number} bottles"
  end

  defp go_for_bottles(0) do
    "Go to the store and buy some more, #{bottles(99)} of beer on the wall."
  end

  defp go_for_bottles(number) do
    "Take #{a_bottle(number)} down and pass it around, #{bottles(number - 1)} of beer on the wall."
  end

  defp a_bottle(1) do
    "it"
  end

  defp a_bottle(_) do
    "one"
  end

  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range \\ 99..0) do
    Enum.map_join(range, "\n", &verse/1)
  end
end
