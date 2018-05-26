defmodule Cards do

  # check this out https://hexdocs.pm/elixir/Kernel.html

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

end
