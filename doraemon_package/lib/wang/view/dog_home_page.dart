import 'package:doraemon_package/wang/bloc/dog_api_bloc.dart';
import 'package:doraemon_package/wang/helper/AudioPlayHelper.dart';
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
        'assets/images/wang_dog_icon.png',
        width: 200,
        height: 200,
      ),
      onTap: () {
        AudioPlayHelper.getInstance().playLocal('audio/dog_wang_wang.wav');
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
        return DogMessageAnimWidget(dogMsg);
      },
    );
  }
}

class DogMessageAnimWidget extends StatefulWidget {
  String msg = "test0";
  DogMessageAnimState state;

  DogMessageAnimWidget(String msg) {
    this.msg = msg;
//    state.update();
  }

  @override
  State<StatefulWidget> createState() {
    state = DogMessageAnimState();
    return state;
  }
}

class DogMessageAnimState extends State<DogMessageAnimWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  String oldMsg;

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    animation = new Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  void update() {
    if (oldMsg != null && oldMsg != widget.msg) {
      controller.reset();
      controller.forward();
    }
    oldMsg = widget.msg;
  }

  @override
  Widget build(BuildContext context) {
    update();
    return ScaleTransition(
      alignment: Alignment.bottomCenter,
      scale: animation,
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 10),
        margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 10),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        child: Text(
          "${widget.msg}",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }

  dispose() {
    controller.dispose();
    super.dispose();
  }
}
