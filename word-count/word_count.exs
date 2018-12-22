defmodule Words do
  @separator_format ~r/[\s_:!?,.&@%$^]/

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> words
    |> word_counters
  end

  @spec words(String.t()) :: [String.t()]
  defp words(sentence) do
    String.split(sentence, @separator_format, trim: true)
  end

  @spec word_counters(String.t()) :: map
  defp word_counters(words) do
    Enum.reduce(words, %{}, &increment_counter/2)
  end

  @spec increment_counter(String.t(), map) :: map
  defp increment_counter(word, counters) do
    Map.update(counters, word, 1, &(&1 + 1))
  end
end
