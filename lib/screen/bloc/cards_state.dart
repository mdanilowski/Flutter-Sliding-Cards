import 'package:floatingcards/screen/model/card_item.dart';

class CardsState {
  final List<CardItem> allCards;

  CardsState(this.allCards);

  CardsState removeFirstCard() {
    allCards.removeAt(0);
    return CardsState(allCards);
  }
}