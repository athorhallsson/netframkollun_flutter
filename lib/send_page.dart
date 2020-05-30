import 'package:flutter/material.dart';

import 'components/send_photos_dialog.dart';

class SendPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yfirlit'),
      ),
      body: SendPhotosDialog(),
    );
  }
}
