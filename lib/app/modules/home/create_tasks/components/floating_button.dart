import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final Stream<bool> stream;

  const FloatingButton({this.onPressed, this.child, this.stream});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: this.stream,
      builder: (context, snapshot) {
        return Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.0))
          ),
          child: RaisedButton(
            color: Colors.purple,
            child: this.child,
            textColor: Colors.white,
            disabledColor: Colors.grey.withAlpha(140),
            disabledTextColor: Colors.white,
            elevation: 0,
            onPressed: snapshot.hasData ? this.onPressed : null,
          ),
        );
      }
    );
  }
}
