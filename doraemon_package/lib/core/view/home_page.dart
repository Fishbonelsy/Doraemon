import 'package:doraemon_package/wang/view/dog_home_page.dart';
import 'package:flutter/material.dart';

class FunctionsHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Image.asset(
              'images/wang_dog_icon.png',
              width: 100,
              height: 100,
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DogHomePage();
              }));
            },
          )
        ],
      ),
    );

  }
}
