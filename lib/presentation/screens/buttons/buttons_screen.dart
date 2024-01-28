import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ButtonsScreen'),
        ),
        body: const _ButtonsView(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back_ios_new_rounded),
        ));
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {}, child: const Text('ElevatedButton')),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Elevate icon'),
            ),
            const ElevatedButton(
                onPressed: null, child: Text('ElevatedButton disabled')),
            FilledButton(onPressed: () {}, child: const Text('FilledButton')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('FilledButton icon')),
            OutlinedButton(
                onPressed: () {}, child: const Text('OutlinedButton')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('OutlinedButton icon')),
            TextButton(onPressed: () {}, child: const Text('TextButton')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('TextButton icon')),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
            const CustomButtoom()
          ],
        ),
      ),
    );
  }
}

class CustomButtoom extends StatelessWidget {
  const CustomButtoom({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Custom Buttoom',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    );
  }
}
