import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CounterScreen extends StatelessWidget {
  static const String name = 'counter';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
        ),
        body: const Center(
          child: Text('Valor: 10'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
