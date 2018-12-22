defmodule Bob do
  def hey(input) do
    cond do
      just_spaces?(input) -> "Fine. Be that way!"
      shouting?(input) && question?(input)-> "Calm down, I know what I'm doing!"
      shouting?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end

  defp just_spaces?(input) do
    String.match?(input, ~r/^\s*$/)
  end

  defp shouting?(input) do
    input == String.upcase(input) && has_alpha_chars?(input)
  end

  defp has_alpha_chars?(input) do
    String.match?(input, ~r/\p{L}/u)
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end
end
