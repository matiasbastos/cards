defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  def create_deck do
    values = ["ace", "two", "three", "four"]
    suits = ["spades", "clubs", "hearts", "diamonds"]
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  Determines if a card is in deck.

  ## Examples

        iex> deck = Cards.create_deck
        iex> Cards.contains?(deck, "ace of spades")
        true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    Deals a hand. `hand_size` is amount of cards to give.

  ## Examples

      iex> Cards.deal(Cards.create_deck, 2)
      {["ace of spades", "two of spades"],
       ["three of spades", "four of spades", "ace of clubs", "two of clubs",
        "three of clubs", "four of clubs", "ace of hearts", "two of hearts",
        "three of hearts", "four of hearts", "ace of diamonds", "two of diamonds",
        "three of diamonds", "four of diamonds"]}

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "The file doesn't exists."
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
