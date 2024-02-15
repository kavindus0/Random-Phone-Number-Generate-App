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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "+94 7$numberGenerated",
                style: const TextStyle(fontSize: 24),
              ),
              IconButton(
                onPressed: () async {
                  await Clipboard.setData(
                      ClipboardData(text: "+94 7$numberGenerated"));
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
                    while ((numberGenerated.toString()).length == 7)
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
