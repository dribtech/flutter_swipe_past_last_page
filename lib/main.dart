import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        '/second': (context) => const SecondScreen(),
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const slides = ['Page 1', 'Page 2', 'Page 3', 'Last page'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: NotificationListener<OverscrollNotification>(
        onNotification: (OverscrollNotification overscrollNotification) {
          if(overscrollNotification.overscroll < 10) {
            return false;
          }

          Navigator.pushNamed(context, '/second');
          return true;
        },
        child: PageView.builder(
          itemBuilder: (context, index) => Container(
              color: Colors.cyan,
              margin: const EdgeInsets.all(10),
              child: Center(
                child: Text(slides[index]),
              )),
          itemCount: slides.length,
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Container(
          color: Colors.amber,
          margin: const EdgeInsets.all(10),
          child: const Center(
            child: Text('So, you finally arrived!'),
          )),
    );
  }
}
