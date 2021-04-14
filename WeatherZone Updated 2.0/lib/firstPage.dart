import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.fromLTRB(20, 120, 20, 20),
      child: Center(
        child: SpinKitFoldingCube(
          color: Colors.black,
          size: 125.0,
        ),
      ),
    );
  }
}