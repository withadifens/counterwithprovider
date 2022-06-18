import 'package:counterwithprovider/pages/home_page.dart';
import 'package:counterwithprovider/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
