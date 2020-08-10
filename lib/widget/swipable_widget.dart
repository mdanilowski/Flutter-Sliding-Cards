import 'package:floatingcards/screen/model/card_item.dart';
import 'package:floatingcards/widget/custom_card.dart';
import 'package:flutter/material.dart';

enum DragDirection { LEFT, RIGHT }

class SwipableCard extends StatefulWidget {
  final Function onCardDismiss;
  final CardItem cardItem;
  final double width;

  const SwipableCard({Key key, this.onCardDismiss, this.cardItem, this.width}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SwipableCardState();
}

class _SwipableCardState extends State<SwipableCard> with SingleTickerProviderStateMixin {
  double targetValue = 0;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: targetValue),
      duration: Duration(milliseconds: 300),
      builder: (BuildContext context, value, Widget child) {
        double animValue = value;
        return Transform(
            transform: Matrix4.identity()..translate(animValue),
            child: CustomCard(
                width: 300,
                height: 400,
                text: widget.cardItem.text,
                color: Color.fromARGB(250, 250, 250, 250),
                onLeftPressed: () {
                  _changeTargetValueAndDismiss(-500);
                },
                onRightPressed: () {
                  _changeTargetValueAndDismiss(500);
                }));
      },
    );
  }

  void _changeTargetValueAndDismiss(double value) async {
    targetValue = value;
    setState(() {});
    await Future.delayed(Duration(milliseconds: 200), () => widget.onCardDismiss());
  }
}
