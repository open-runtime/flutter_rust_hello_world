import 'package:flutter/material.dart';
import 'package:flutter_rust_hello_world/src/rust/api/simple.dart';
import 'package:flutter_rust_hello_world/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  String greeting() {
    return 'Action: Call Rust `greet("Mark")`\nResult: `${greet(name: "Mark")}`';
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Center(
          child: FutureBuilder<String>(
            future: (() async {
              String _greeting = greeting();
              // TODO add our stringLength
              return '$_greeting: (??? chars)';
            })(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text(snapshot.data ?? 'No data');
              }
            },
          ),
        ),
      ),
    );
  }
}
