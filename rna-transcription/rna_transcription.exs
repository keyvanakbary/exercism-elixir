defmodule RNATranscription do
  @doc """
  Transcribes a character list representing DNA nucleotides to RNA

  ## Examples

  iex> RNATranscription.to_rna('ACTG')
  'UGAC'
  """
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    dna |> Enum.map(&complement/1)
  end

  @spec complement(char) :: char
  defp complement(nucleotide) do
    case nucleotide do
      ?G -> ?C
      ?C -> ?G
      ?T -> ?A
      ?A -> ?U
    end
  end
end
