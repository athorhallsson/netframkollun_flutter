import 'package:flutter/material.dart';

class Gradients {

  static const boka = const BoxDecoration(
    gradient: const LinearGradient(
      colors: [
        Color.fromARGB(255, 140, 198, 63),
        Color.fromARGB(255, 0, 84, 148),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      stops: [0.2, 0.8],
    ),
  );
}

class MyColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const blue = const Color.fromARGB(255, 0, 84, 148);
  static const darkBlue = const Color.fromARGB(255, 36, 51, 65);
  static const green = const Color.fromARGB(255, 140, 198, 63);
  static const lightBlue = const Color.fromARGB(255, 229, 234, 238);
  static const smoke = const Color.fromARGB(255, 238, 237, 240);
  static const lightGrey = const Color.fromARGB(255, 219, 219, 219);
  static const grey = const Color.fromARGB(255, 189, 194, 198);
  static const shadow = const Color.fromARGB(18, 36, 51, 66);
  static const red = const Color.fromARGB(255, 247, 64, 68);
  static const dark = const Color.fromARGB(255, 36, 52, 64);
}

class MyTextStyles {
  static const headerOne = TextStyle(fontSize: 18.0, color: MyColors.black, fontWeight: FontWeight.w600);
  static const headerTwo = TextStyle(fontSize: 16.0, color: MyColors.dark, fontWeight: FontWeight.w400);

  static const title = TextStyle(fontSize: 25.0, color: MyColors.black, fontWeight: FontWeight.w600);

  static const cardTitle = TextStyle(fontSize: 18.0, color: MyColors.black, fontWeight: FontWeight.bold);
  static const cardTitleWhite = TextStyle(fontSize: 18.0, color: MyColors.white, fontWeight: FontWeight.bold);
  static const cardSubtitleWhite = TextStyle(fontSize: 18.0, color: MyColors.white, fontWeight: FontWeight.normal);
  static const cardSubtitle = TextStyle(fontSize: 18.0, fontWeight: FontWeight.normal);
  static const cardSubtitleRed = TextStyle(fontSize: 18.0, color: MyColors.red, fontWeight: FontWeight.normal);

  static const catalogCardTitle = TextStyle(fontSize: 24.0, color: MyColors.white, fontWeight: FontWeight.bold);
  static const catalogCardSubtitle = TextStyle(fontSize: 12.0, color: MyColors.white, fontWeight: FontWeight.normal);

  static const catalogSectionTitle = TextStyle(fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w600);
  static const catalogSectionSubtitle = TextStyle(fontSize: 20.0, color: MyColors.grey, fontWeight: FontWeight.w300);

  static const shopTab = TextStyle(fontSize: 18.0, color: MyColors.blue, fontWeight: FontWeight.w600);

  static const aboutUsTitle = TextStyle(fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.normal);
  static const aboutUsDescription = TextStyle(fontSize: 14.0, color: MyColors.black, fontWeight: FontWeight.normal,);
  static const bold = TextStyle(fontSize: 14.0, color: MyColors.black, fontWeight: FontWeight.bold,);

  static const textWhite = TextStyle(color: MyColors.white);
  static const textBlue = TextStyle(color: MyColors.blue);
  static const boldGreen = TextStyle(color: MyColors.green, fontWeight: FontWeight.w600);
  static const boldBlue = TextStyle(color: MyColors.blue, fontWeight: FontWeight.bold);

  static const blue = TextStyle(color: MyColors.blue);


  static const notificationBodyStyle = TextStyle(fontSize: 14.0, color: MyColors.black, fontWeight: FontWeight.normal, height: 0.9);

  static const profileCardTitle = TextStyle(fontSize: 18.0, color: MyColors.black, fontWeight: FontWeight.w600);
  static const profileCardBody = TextStyle(fontSize: 13.0, color: MyColors.black, fontWeight: FontWeight.normal, height: 1.2);

  static const placeholder = TextStyle(fontSize: 22.0, color: MyColors.grey, fontWeight: FontWeight.w400);
  static const textInput = TextStyle(fontSize: 24.0, color: MyColors.black, fontWeight: FontWeight.w400);

  static const button = TextStyle(fontSize: 18.0, color: MyColors.white, fontWeight: FontWeight.w400);

  static const loginGreenUnderline = TextStyle(color: MyColors.green, fontWeight: FontWeight.w400, fontSize: 18.0);

  static const google = TextStyle(color: MyColors.dark, fontWeight: FontWeight.bold, fontSize: 18.0);

  static const errorTitle = TextStyle(color: MyColors.white, fontWeight: FontWeight.bold, fontSize: 20.0);
  static const errorBody = TextStyle(color: MyColors.white, fontWeight: FontWeight.normal, fontSize: 16.0);

  static const monthSelect = TextStyle(fontSize: 22.0, color: MyColors.darkBlue, fontWeight: FontWeight.w800);

  static const noAvailable = TextStyle(fontSize: 14.0, color: MyColors.white, fontWeight: FontWeight.w400);

  /* Search */

  static const searchHint = TextStyle(fontSize: 24.0, color: MyColors.blue);
  static const categoryTitle = TextStyle(fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w600);
  static const categoryCardTitle = TextStyle(fontSize: 14.0, color: MyColors.white, fontWeight: FontWeight.bold);
  static const sectionTitle = TextStyle(fontSize: 20.0, color: MyColors.black, fontWeight: FontWeight.w600);
  static const sectionCardTitle = TextStyle(fontSize: 14.0, color: MyColors.white);
}

class Layout {
  static const containerPadding = 20.0;
  static const cardPadding = EdgeInsets.all(10.0);
  static const cardPaddingVertical = EdgeInsets.symmetric(vertical: 15.0);
  static const cardPaddingHorizontal = EdgeInsets.symmetric(horizontal: 20.0);
  static const cardPaddingUneven = EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0);
  static const cardBorderRadius = Radius.circular(10.0);
  static final cardBoxShadow = List<BoxShadow>.filled(1, BoxShadow(blurRadius: 10.0, color: MyColors.shadow, spreadRadius: 5.0));
  static final border = Border.all(color: MyColors.shadow, width: 1.0);
  static const borderBottom = Border(bottom: BorderSide(color: MyColors.shadow, width: 1.0));
  static const buttonBorderRadius = Radius.circular(20.0);
  static const borderBottomGreen = Border(bottom: BorderSide(color: MyColors.green, width: 1.0));
}


