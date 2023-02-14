import 'package:flutter/material.dart';

class EmitBtn extends StatelessWidget {
  const EmitBtn({Key? key, required this.onPressed, required this.txt})
      : super(key: key);
  final void Function() onPressed;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(onPressed: onPressed, child: Text(txt));
  }
}
