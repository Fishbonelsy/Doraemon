import 'package:doraemon_package/wang/view/home_page.dart';
import 'package:flutter/material.dart';

class FunctionsHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(40),
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: Text("Wang"),
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
