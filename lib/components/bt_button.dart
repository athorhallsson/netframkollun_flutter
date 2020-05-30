import 'package:flutter/material.dart';

import '../styles.dart';

class BtButton extends StatelessWidget {
  final bool disabled;
  final bool danger;
  final String title;
  final Function function;

  BtButton(this.function, this.title, {this.disabled = false, this.danger = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !disabled ? function : () => {},
      child: Container(
        margin: EdgeInsets.only(left: Layout.containerPadding, right: Layout.containerPadding),
        decoration: BoxDecoration(
            color: disabled ? MyColors.grey : (danger ? MyColors.red : MyColors.green),
            borderRadius: BorderRadius.all(Layout.buttonBorderRadius)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18.0),
          child: Text(
            title,
            style: MyTextStyles.button,
          ),
        ),
      ),
    );
  }
}
