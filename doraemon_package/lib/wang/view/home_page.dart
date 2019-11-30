import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DogHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 100),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Image.asset(
          'images/wang_dog_icon.png',
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
