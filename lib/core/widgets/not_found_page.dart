import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Page Was Not Found :(", style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
