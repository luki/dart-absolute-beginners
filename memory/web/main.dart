// Copyright (c) 2016, Luke Muller. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:async';

const int NUM_CARDS = 16;
const int NUM_OF_EACH = 4;
const String CARD_BACK ="images/card_back.png";
const List<String> CARD_FILE_NAMES = const["images/dog.png", "images/cat.png", "images/giraffe.png", "images/turtle.png"];

int strikes, cardsLeft;
List<String> cards;
ImageElement lastClicked;

void main() {
  for (int i = 0; i < NUM_CARDS; i++) {
    ImageElement ie = new ImageElement(height: 100, width: 100);
    ie.onClick.listen(cardClicked);
    ie.alt = i.toString();
    querySelector("#card_box").append(ie);
  }
  querySelector("#new_game_button").onClick.listen(newGame);
  reset();
}

void reset() {
  strikes = 0;
  cardsLeft = NUM_CARDS;
  querySelector("#num_strikes").text = strikes.toString();
  querySelector("#num_left").text = cardsLeft.toString();
  for (ImageElement img in querySelectorAll("img")) {
    img.src = CARD_BACK;
  }

  cards = new List();
  for (String cardFileName in CARD_FILE_NAMES) {
    for (int i = 0; i < NUM_OF_EACH; i++) {
      cards.add(cardFileName);
    }
  }
  cards.shuffle();
}

void cardClicked(MouseEvent event) {
  ImageElement clickedCard = event.target; // Card that was clicked
  // If card is already turned over (not CARD_BACK)
  if (!clickedCard.src.endsWith(CARD_BACK)) {
    return ;
  }
  int clickedNumber = int.parse(clickedCard.alt);
  clickedCard.src = cards[clickedNumber];
  if (lastClicked == null) {
    lastClicked = clickedCard;
  } else {
    // Match
    if (clickedCard.src == lastClicked.src) {
      cardsLeft -= 2;
      querySelector("#num_left").text = cardsLeft.toString();
    } else {
      strikes += 1;
      querySelector("#num_strikes").text = strikes.toString();
      ImageElement tempClicked = lastClicked;
      Timer t = new Timer(const Duration(seconds: 2), () {
        clickedCard.src = CARD_BACK;
        tempClicked.src = CARD_BACK;
      });
    }
    lastClicked = null;
  }
}

void newGame(MouseEvent event) => reset();
