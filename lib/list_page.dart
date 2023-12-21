import 'package:flutter/material.dart';

import 'animated_tile.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key, required this.title});

  final String title;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> with TickerProviderStateMixin {
  //animation
  late AnimationController animationController;
  late Animation<double> animation;

  //data
  List<String> books = [
    "Dandelion Wine",
    "Tress of the Emerald Sea",
    "The Blue Castle",
    "Reflex",
    "The Storied Life of AJ Fikry"
  ];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animation = CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn);
    // animationController.addListener(
    //   () {
    //     print(animation.value);
    //   },
    // );

    startAnimation();

    super.initState();
  }

  void startAnimation() {
    animationController.value = 0;
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return AnimatedTile(
                  animation: animation,
                  slide: index * 10,
                  child: ListTile(
                    leading: Image.asset(
                      "images/${books[index].toLowerCase()}.jpg",
                      width: 100,
                      height: 100,
                    ),
                    title: Text(
                      books[index],
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ));
            }));
  }
}
