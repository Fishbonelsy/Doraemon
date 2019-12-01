import 'package:doraemon_package/wang/bloc/dog_api_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DogHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DogApiBloc>(
      builder: (context) => DogApiBloc(),
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 0, top: 0, right: 0, bottom: 100),
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            DogMessageButtonWidget(),
            DogMessageWidget(),
          ],
        ),
      ),
    );
  }
}

class DogMessageButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Image.asset(
        'images/wang_dog_icon.png',
        width: 300,
        height: 300,
      ),
      onTap: () {
        BlocProvider.of<DogApiBloc>(context).add(DogApiRequest());
      },
    );
  }

}

class DogMessageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DogApiBloc, DogMessage>(
      builder: (BuildContext context, DogMessage message) {
        String dogMsg = message.content;
        return Text("${dogMsg}");
      },
    );
  }
}
