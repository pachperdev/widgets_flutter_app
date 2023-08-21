import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola, soy un snackbar'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Cerrar',
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('¿Estas seguro?'),
          content: const Text(
              'Duis ullamco laboris et est nisi. Officia non culpa dolor laboris sit. Irure nisi deserunt minim commodo. Do dolor Lorem non consequat et ut fugiat eu dolor minim non nulla ullamco.'),
          actions: [
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y Dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Flutter Widgets',
                  children: [
                    const Text(
                        'Ipsum ut sit sit velit velit nisi exercitation qui elit ipsum anim. Fugiat dolor eiusmod nulla non eu reprehenderit cillum labore aliqua excepteur cillum enim eu non. Quis enim magna minim nulla adipisicing ut eiusmod occaecat quis nisi laboris esse minim enim. Dolor elit sit do anim esse cupidatat mollit id cillum minim veniam fugiat. Non nisi ipsum occaecat officia do ad eu ex nostrud consequat sint labore ipsum aute. Velit do veniam id cillum fugiat ullamco ex commodo incididunt incididunt aliquip quis.')
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () {
          showCustomSnackbar(context);
        },
      ),
    );
  }
}
