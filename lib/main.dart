import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_state_management/user.dart';

//final nameProvider = Provider<String>((ref) => "mv");

final fetchUserProvider = FutureProvider((ref) {
  const url = 'https://jsonplaceholder.typicode.com/posts';

  return http.get(Uri.tryParse(url)!).then((value) => postFromJson(value.body));
});

void main() {
  runApp(const ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
