"""
Applet: Blackjack
Summary: Show how to play bj hand
Description: Displays blackjack hands, and gives the recommended advice on how to play it.
Author: jmordars
"""

load("random.star", "random")
load("render.star", "render")
load("schema.star", "schema")

DEFAULT_STATE = "Aruba"

DEFAULT_COLOR_HIT = "#00ff38"  # green
DEFAULT_COLOR_STAND = "#f9cd03"  # yellow
DEFAULT_COLOR_DOUBLE = "#0000ff"  # blue
DEFAULT_COLOR_SPLIT = "#ff0000"  # red
DEFAULT_COLOR_SURRENDER = "#ff41ff"  # purple

def main(config):
    state = config.str("state", DEFAULT_STATE)
    # message = "{}!".format(state)

    # Get the dealer's hand to play against
    dealer_card = random.number(1, 13)
    dealer_text = "{} OF {}".format(get_card(dealer_card), get_suit())

    # Get the player's cards
    # player_card_one = random.number(1, 13)
    # player_card_two = random.number(1, 13)

    return render.Root(
        child = render.Text(dealer_text, color = get_color(state)),
    )

def get_color(state):
    if (state == "Hit"):
        return DEFAULT_COLOR_HIT
    elif (state == "Stand"):
        return DEFAULT_COLOR_STAND
    elif (state == "Double"):
        return DEFAULT_COLOR_DOUBLE
    elif (state == "Split"):
        return DEFAULT_COLOR_SPLIT
    elif (state == "Surrender"):
        return DEFAULT_COLOR_SURRENDER
    else:
        return "#ffffff"

def get_card(value):
    if (1 == value):
        return "ACE"
    if (2 == value):
        return "TWO"
    if (3 == value):
        return "THREE"
    if (4 == value):
        return "FOUR"
    if (5 == value):
        return "FIVE"
    if (6 == value):
        return "SIX"
    if (7 == value):
        return "SEVEN"
    if (8 == value):
        return "EIGHT"
    if (9 == value):
        return "NINE"
    if (10 == value):
        return "TEN"
    if (11 == value):
        return "JACK"
    if (12 == value):
        return "QUEEN"
    if (13 == value):
        return "KING"
    else:
        return "ERROR"

def get_suit():
    suit = random.number(0, 3)

    if (0 == suit):
        return "♣"
    if (1 == suit):
        return "♦"
    if (2 == suit):
        return "♥"
    else:
        return "♠"

def get_schema():
    return schema.Schema(
        version = "1",
        fields = [
            schema.Text(
                id = "state",
                name = "State?",
                desc = "What the player should do",
                icon = "user",
            ),
        ],
    )
