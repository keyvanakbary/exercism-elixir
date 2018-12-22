defmodule Roman do
  @roman_numbers %{
    0 => "",
    1 => "I",
    2 => "II",
    3 => "III",
    4 => "IV",
    5 => "V",
    6 => "VI",
    7 => "VII",
    8 => "VIII",
    9 => "IX",
    10 => "X",
    20 => "XX",
    30 => "XXX",
    40 => "XL",
    50 => "L",
    60 => "LX",
    70 => "LXX",
    80 => "LXXX",
    90 => "XC",
    100 => "C",
    200 => "CC",
    300 => "CCC",
    400 => "CD",
    500 => "D",
    600 => "DC",
    700 => "DCC",
    800 => "DCCC",
    900 => "CM",
    1000 => "M",
    2000 => "MM",
    3000 => "MMM"
  }

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    roman(number, 1, "")
  end

  @spec roman(pos_integer, pos_integer, String.t()) :: String.t()
  defp roman(0, _, roman) do
    roman
  end

  @spec roman(pos_integer, pos_integer, String.t()) :: String.t()
  defp roman(number, magnitude, roman) do
    rest = div(number, 10)
    part = (number - rest * 10) * magnitude
    roman(rest, magnitude * 10, @roman_numbers[part] <> roman)
  end
end
