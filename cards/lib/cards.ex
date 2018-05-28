defmodule Cards do

  @moduledoc """
    provides methods for creating and handling a deck of cards
    using https://hexdocs.pm/elixir/Kernel.html to learn elixir :)
  """
  # run console iex -S mix

  @doc """
    Returns a list of strings representing a deck of playing cards
  """
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

  @doc """
    Determines whether a deck contains a given card
  ## Examples
      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "ACE of Spades")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The `hand_size` argument indicates how many cards should
    be in the hand.
  ## Examples
      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["ACE of Spades"]
  """
  def deal(deck, hand_size) do
    # pattern matching ---
    Enum.split(deck, hand_size)
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

  def create_hand(hand_size) do
    # horrible way
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cands.deal(deck, hand_size)

    # beautiful way :)
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end


end
