import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/main.dart';
import 'package:riverpod_state_management/user.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(fetchUserProvider).when(data: (data) {
      return Scaffold(
        appBar: AppBar(
          title: Text(data[0].title!),
        ),
      );
    }, error: (error, stackTrace) {
      return const Center(
        child: Text("error in geting data"),
      );
    }, loading: () {
      return Center(
        child: CircularProgressIndicator(),
      );
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: Container(
        child: Center(
          child: Text("adat"),
        ),
      ),
    );
  }
}
