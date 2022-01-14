import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String title;
  final VoidCallback? callback;
  const MyButton({Key? key, required this.title, this.callback})
      : super(key: key);

  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.callback,
        child: Text(widget.title),
        style: ElevatedButton.styleFrom(
            primary: widget.title == 'Hello State' ? Colors.red : Colors.blue));
  }
}
