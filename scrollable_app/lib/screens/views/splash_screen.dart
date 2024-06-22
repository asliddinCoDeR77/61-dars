import 'package:flutter/material.dart';
import 'package:scrollable_app/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.slowMiddle,
    );

    _controller!.forward();

    _controller!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const MyHomePage(
                    title: '',
                  )),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _animation!,
          child: Image.asset(
            'assets/images/logo.png',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
