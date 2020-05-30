import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'components/add_photo_button.dart';
import 'components/photo_item_dialog.dart';
import 'components/photos_screen.dart';
import 'components/top_action_button.dart';

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pedromyndir - Framköllun"),
        actions: <Widget>[
          if (appState.getCurrentPhoto == null) TopActionButton()
        ],
      ),
      body: Stack(children: <Widget>[
        PhotosScreen(),
        if (appState.getCurrentPhoto != null) PhotoItemDialog(),
      ],),
      floatingActionButton: appState.getCurrentPhoto == null ? AddPhotoButton() : null,
    );
  }
}
