import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final String text;
  final Function onLeftPressed;
  final Function onRightPressed;

  const CustomCard(
      {Key key, this.color, this.width, this.height, this.onLeftPressed, this.onRightPressed, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Card(
          child: Column(
            children: <Widget>[
              Expanded(child: Center(child: Text(text))),
              Row(
                children: <Widget>[
                  Expanded(
                    child: FlatButton(
                      onPressed: onLeftPressed,
                      child: Text("WRONG"),
                    ),
                  ),
                  Expanded(
                    child: FlatButton(
                      onPressed: onRightPressed,
                      child: Text("RIGHT"),
                    ),
                  )
                ],
              )
            ],
          ),
          color: color),
    );
  }
}
