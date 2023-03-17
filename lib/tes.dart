import 'package:flutter/material.dart';

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter",
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(
            color: Colors.red,
          ),
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: (() {}),
              child: const Text("Press here"),
            ),
            ElevatedButton(
              onPressed: (() {}),
              child: const Text("Press here"),
            ),
            ElevatedButton(
              onPressed: (() {}),
              child: const Text("Press here"),
            ),
          ],
        )
      ]),
    );
  }
}
