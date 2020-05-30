import 'package:flutter/material.dart';

class TopActionButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text("Áfram", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      onPressed: () => Navigator.pushNamed(context, '/yfirlit')
    );
  }

}
