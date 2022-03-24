import 'package:flutter/material.dart';
import 'package:neuroagent/models/provider_data.dart';
import 'package:provider/provider.dart';

import 'screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderData>(
      create: (context) => ProviderData(),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff023e8a),
          backgroundColor: const Color(0xff023e8a),
        ),
        home: Login(),
      ),
    );
  }
}
