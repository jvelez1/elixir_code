defmodule Cards do

  # check this out https://hexdocs.pm/elixir/Kernel.html
  # run console iex -S mix

  def create_deck do
    values =  ['ACE', 'TWO', 'THREE', 'FOUR', 'FIVE']
    suits = ['Spades', 'Clubs', 'Hearts', 'Diamonds']

    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    # pattern matching ---
    {hand, rest} = Enum.split(deck, hand_size)
    IO.puts 'hand pick up'
    IO.puts hand
    IO.puts 'rest of deck'
    IO.puts rest
    {hand, rest}
  end

  def save(deck, file_name) do
    binary = :erlang.term_to_binary(deck) #Usign erlang programming language
    File.write(file_name, binary)
  end

  def load(file_name) do
    # Easy way.... #

    # {status, binary} = File.read(file_name)
    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "Something is not working"
    # end

    # nice way, with pattern matching
    case File.read(file_name) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _reason } -> "Something is not working" # use '_' when is not used. if you delete the variable 'reason', pattern matching won't work
    end
  end

end
