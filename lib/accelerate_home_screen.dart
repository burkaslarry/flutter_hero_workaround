// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _speed = 0;
  static const _rocket = "🚀";
  static const _title = "Home";
  static const _textStyle = TextStyle(
    fontSize: 24,
  );
  static const _speedOfLight = 299792458;

  late AnimationController _controller;

  late Animation<double> curve =
      CurvedAnimation(parent: _controller, curve: Curves.easeOut);
  late Animation<int> alpha =
      IntTween(begin: 0, end: _speedOfLight).animate(curve);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _rocket,
              style: _textStyle,
            ),
            SizedBox(height: 16),
            Text(
              _speed.toString(),
              style: _textStyle,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _controller.forward();
              },
              child: Text('Accelerate'),
            ),
          ],
        ),
      ),
    );
  }
}
