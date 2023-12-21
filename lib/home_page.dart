import 'package:column_animations/list_page.dart';
import 'package:flutter/material.dart';

import 'animated_tile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  //animation
  late AnimationController animationController;
  late Animation<double> animation;
  List<int> slide = [30, 60, 90];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInCirc);
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedTile(
              animation: animation,
              slide: slide[0],
              child: Text(
                'Inspiring quote',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: AnimatedTile(
                animation: animation,
                slide: slide[1],
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      "... repeating and repeating the fine and golden words,... as they would be repeated every winter for all the white winters in time. Saying them over and over on the lips, like a smile, like a sudden patch of sunlight in the dark. Dandelion wine. Dandelion wine. Dandelion wine.",
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ),
            AnimatedTile(
              animation: animation,
              slide: slide[2],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Dandelion Wine - Ray Bradbury',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ListPage(title: "List Animation")),
                    );
                  },
                  child: const Text("Go to list page")),
            )
          ],
        ),
      ),
    );
  }
}
