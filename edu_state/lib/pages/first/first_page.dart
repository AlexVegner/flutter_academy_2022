import 'package:edu_state/widgets/my_button.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  final String title;
  final VoidCallback? callback;

  const FirstPage({Key? key, required this.title, this.callback})
      : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          color: Colors.green,
          child: Column(
            children: [
              MyButton(callback: widget.callback, title: widget.title)
            ],
          ),
        ),
      ),
    );
  }
}
