import 'package:flutter/material.dart';

import 'calculator.dart';

void main() {
  runApp(start());
}

class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: cal(),
      debugShowCheckedModeBanner: false,
    );
  }
}
