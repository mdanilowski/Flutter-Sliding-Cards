import 'package:floatingcards/screen/bloc/cards_bloc.dart';
import 'package:floatingcards/screen/bloc/cards_event.dart';
import 'package:floatingcards/screen/bloc/cards_state.dart';
import 'package:floatingcards/widget/swipable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainScreenState();
}

enum DragDirection { LEFT, RIGHT }

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CardsBloc(),
      child: Scaffold(
          backgroundColor: Colors.amberAccent,
          body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 64.0, bottom: 16),
              child: Text("CARDS",
                  style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32.0)),
            ),
            BlocBuilder<CardsBloc, CardsState>(builder: (context, state) {
              return Expanded(
                child: Stack(
                    alignment: Alignment.center,
                    children: state.allCards
                        .take(3)
                        .toList()
                        .reversed
                        .toList()
                        .asMap()
                        .map((i, c) => MapEntry(
                            i,
                            Positioned(
                                key: ValueKey(c.text),
                                top: 10.0 * i,
                                child: SwipableCard(
                                    cardItem: c,
                                    onCardDismiss: () =>
                                        BlocProvider.of<CardsBloc>(context).add(RemoveCard())))))
                        .values
                        .toList()),
              );
            })
          ])),
    );
  }
}
