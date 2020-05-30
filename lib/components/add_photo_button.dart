import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netframkollun_flutter/styles.dart';
import 'package:netframkollun_flutter/web/custom_cursor.dart';


import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';

import '../app_state.dart';

class AddPhotoButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return CustomCursor(
      cursorStyle: CustomCursor.pointer,
      child: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () => getImage(appState.postPhotoAction),
        tooltip: 'Bæta við mynd',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  getImage(Function callback) {
    getFile().then((value) => callback(value))
              .catchError((error) => print(error));
  }

  Future<String> getFile() {
    print("getting file");
    final completer = new Completer<String>();
    final InputElement input = document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'image/*';
    input.addEventListener('change', (e) async {
      print("picked");
      final List<File> files = input.files;
      final reader = new FileReader();
      reader.readAsDataUrl(files[0]);
      reader.onError.listen((error) => completer.completeError(error));
      await reader.onLoad.first;
      print("completing");
      completer.complete(reader.result as String);
    });
    input.click();
    print("clicked");
    return completer.future;
  }
}
