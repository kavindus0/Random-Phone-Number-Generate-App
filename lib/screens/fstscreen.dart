import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var numberGenerated = Random().nextInt(100000000);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "$numberGenerated",
                style: const TextStyle(fontSize: 24),
              ),
              IconButton(
                onPressed: () async {
                  await Clipboard.setData(
                      const ClipboardData(text: "your text"));
                },
                icon: const Icon(Icons.copy),
                iconSize: 24,
                color: Colors.blueGrey,
                // copied successfully
              ),
            ],
          ),
          SizedBox.fromSize(
            size: const Size(0, 60),
          ),
          TextButton(
              onPressed: () {
                setState(
                  () {
                    numberGenerated = Random().nextInt(100000000);
                  },
                );
              },
              child: Text('Generate'))
        ],
      ),
    );
  }
}
