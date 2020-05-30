import 'package:flutter/material.dart';
import 'package:netframkollun_flutter/models/photo_size.dart';
import 'package:netframkollun_flutter/styles.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';
import 'bt_button.dart';

class PhotoItemDialog extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return GestureDetector(
      onTap: () => appState.closePhotoDialogAction(),
      child: Container(
          color: Colors.black45.withAlpha(100),
          child: Center(
              child: GestureDetector(
                onTap: () => {},
                child: Card(
                  child: Container(
                    constraints: BoxConstraints.tightFor(width: 600, height: 800),
                    color: MyColors.white,
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => appState.closePhotoDialogAction(),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Icon(Icons.close),
                                  )
                              ),
                            ],
                          ),
                          Container(
                            color: MyColors.lightBlue,
                            child: appState.getCurrentPhoto.url != null ? Image.network(appState.getCurrentPhoto.url) : Container(),
                          ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15)), color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.photo),
                                  DropdownButton<PhotoSize>(
                                    value: appState.getCurrentPhoto.size,
                                    items: appState.getSizes.map((value) {
                                      return DropdownMenuItem<PhotoSize>(
                                        value: value,
                                        child: Text(value.name),
                                      );
                                    }).toList(),
                                    onChanged: (item) {
                                      appState.updateCurrentPhotoSizeAction(item);
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Icon(Icons.filter),
                                  DropdownButton<int>(
                                    value: appState.getCurrentPhoto.quantity,
                                    style: MyTextStyles.headerOne,
                                    items: appState.getQuantities.map((int value) {
                                      return DropdownMenuItem<int>(
                                        value: value,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                                          child: Text(value.toString(), style: MyTextStyles.headerOne),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (q) {
                                      appState.updateCurrentPhotoQuantityAction(q);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RaisedButton(
                              child: Text("eyða"),
                              onPressed: () => null, // appState.deletePhotoAction(appState.getCurrentPhoto),
                            ),
                            RaisedButton(
                                onPressed: () => appState.updatePhotoAction(appState.getCurrentPhoto),
                                child: Text("vista")
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
          )
      ),
    );
  }

}
