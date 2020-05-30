
import 'package:flutter/material.dart';
import 'package:netframkollun_flutter/send_page.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: MaterialApp(
        title: 'Pedromyndir - Framköllun',
        theme: ThemeData(
          buttonTheme: ButtonThemeData(
              padding: EdgeInsets.all(8),
              splashColor: Colors.transparent,
              buttonColor: Colors.red,
              disabledColor: Colors.grey,
              textTheme: ButtonTextTheme.primary
          ),
          brightness: Brightness.light,
          primaryColor: Colors.red[500],
          accentColor: Colors.red[500],
        ),
        routes: <String, WidgetBuilder>{
          '/': (context) {
            return MyHomePage();
          },
          '/yfirlit': (context) {
            return SendPage();
          }
        },
      ),
    );
  }
}


