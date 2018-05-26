defmodule Cards do

  def create_deck do
    ['ACE', 'TWO', 'THREE']
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

end
