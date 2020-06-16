import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../app_state.dart';
import '../styles.dart';

// Create a Form widget.
class SendPhotosDialog extends StatefulWidget {
  @override
  SendPhotosDialogState createState() {
    return SendPhotosDialogState();
  }
}

class SendPhotosDialogState extends State<SendPhotosDialog> {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    // Build a Form widget using the _formKey created above.
    return appState.getOrder == null
        ? Container()
        : Container(
      color: Colors.black12,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Tengiliður', textAlign: TextAlign.center, style: MyTextStyles.headerOne),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text('Nafn:', style: MyTextStyles.headerTwo,),
              ),
              TextFormField(
                onChanged: (value) {
                  appState.changeNameAction(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Nafn má ekki vera tómt';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text('Netfang:', style: MyTextStyles.headerTwo,),
              ),
              TextFormField(
                onChanged: (value) {
                  appState.changeEmailAction(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Netfang má ekki vera tómt';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text('Símanúmer:', style: MyTextStyles.headerTwo,),
              ),
              TextFormField(
                onChanged: (value) {
                  appState.changePhoneAction(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Símanúmer má ekki vera tómt';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text('Heimsending', style: MyTextStyles.headerOne,),
              ),
              Switch(
                value: appState.getOrder?.pickup == null ? false : appState.getOrder.pickup,
                onChanged: (v) => appState.changePickupAction(v),
              ),
              if (appState.getOrder?.pickup) Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text('Heimilisfang:', style: MyTextStyles.headerTwo,),
              ),
              if (appState.getOrder?.pickup) TextFormField(
                onChanged: (value) {
                  appState.changeNameAction(value);
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Heimilisfang má ekki vera tómt';
                  }
                  return null;
                },
              ),
              if (appState.getOrder?.pickup) Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text('Póstnúmer:', style: MyTextStyles.headerTwo,),
              ),
              if (appState.getOrder?.pickup) DropdownButtonFormField<String>(
                value: appState.getOrder?.postCode,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Póstnúmer má ekki vera tómt';
                  }
                  return null;
                },
//                style: MyTextStyles.headerOne,
                items: appState.getPostCodes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 15),
                      child: Text(value.toString()),
                    ),
                  );
                }).toList(),
                onChanged: (q) {
                  appState.changePostCodeAction(q);
                },
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: appState.isPriceLoading ? CircularProgressIndicator() : Text(appState.getTotalPrice.toString() + ' kr.'),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      // Validate returns true if the form is valid, or false
                      // otherwise.
                      if (_formKey.currentState.validate()) {
                        // If the form is valid, display a Snackbar.
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Sendi pöntun')));
                      }
                    },
                    child: Text('Senda inn pöntun'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



