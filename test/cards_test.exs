defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck gives 16 cards and contains 'ace of spades'" do
    deck = Cards.create_deck
    assert Enum.count(deck) == 16
    assert Enum.member?(deck, "ace of spades")
  end

  test "shuffle is random" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
