import 'package:flutter/material.dart';
import 'package:pet_perfect/core/di.dart';
import 'package:pet_perfect/presentation/screens/home_screen.dart';
import 'package:pet_perfect/presentation/screens/posts_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
