import 'package:flutter/material.dart';

import 'widgets/header.dart';
import 'widgets/footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Header(),
        body:  Center(child: Text("うんこ")),
        bottomNavigationBar: Footer()
      )
    );
  }
}