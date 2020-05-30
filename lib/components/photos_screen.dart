import 'package:flutter/material.dart';
import 'package:netframkollun_flutter/components/send_photos_dialog.dart';
import 'package:netframkollun_flutter/models/photo.dart';
import 'package:netframkollun_flutter/web/custom_cursor.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import '../styles.dart';

class PhotosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return appState.getPhotos.isEmpty
            ? _emptyPhotosText()
            : _renderPhotos(appState);
  }

  Widget _emptyPhotosText() {
    return Container(
      color: Colors.black12,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'bættu við myndum með því að ýta á plúsinn',
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderPhotos(AppState appState) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Colors.black12,
      child: GridView(
        shrinkWrap: false,
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 450,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1),
        children:
            appState.getPhotos.map((p) => _renderPhoto(appState, p)).toList(),
      ),
    );
  }

  Widget _renderPhoto(AppState appState, Photo photo) {
    return Container(
      height: 380,
      width: 380,
      child: CustomCursor(
        cursorStyle: CustomCursor.pointer,
        child: GestureDetector(
          onTap: () => appState.openPhotoAction(photo),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 4, left: 20, right: 20),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Expanded(
                      flex: 85,
                      child: Container(
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(photo.url), fit: BoxFit.contain)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 15,
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(Icons.photo),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                                    child: Text(photo.size != null ? photo.size.name : "",
                                        style: MyTextStyles.headerTwo)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.filter),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 0, horizontal: 6),
                                    child: Text(photo.quantity.toString() + " stk",
                                        style: MyTextStyles.headerTwo)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
