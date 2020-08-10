import 'package:floatingcards/screen/bloc/cards_event.dart';
import 'package:floatingcards/screen/bloc/cards_state.dart';
import 'package:floatingcards/screen/model/card_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardsBloc extends Bloc<CardsEvent, CardsState> {
  CardsBloc()
      : super(CardsState(List.of([
          CardItem("TEST 1"),
          CardItem("TEST 2"),
          CardItem("TEST 3"),
          CardItem("TEST 4"),
          CardItem("TEST 5"),
          CardItem("TEST 6"),
          CardItem("TEST 7"),
          CardItem("TEST 8"),
          CardItem("TEST 9"),
          CardItem("TEST 10"),
          CardItem("TEST 11"),
          CardItem("TEST 12"),
        ])));

  @override
  Stream<CardsState> mapEventToState(CardsEvent event) async* {
    switch (event.runtimeType) {
      case RemoveCard:
        yield state.removeFirstCard();
        break;
    }
  }
}
