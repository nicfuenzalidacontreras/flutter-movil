import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackBarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackBarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'OK!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('¿Estás seguro?'),
              content: const Text(
                  'Est eu qui cillum aliquip ut excepteur eiusmod elit. Elit veniam minim cillum commodo velit exercitation non cillum qui. Cillum ullamco pariatur deserunt veniam consectetur dolore commodo nulla.'),
              actions: [
                TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () => context.pop()),
                FilledButton(
                  child: const Text('Aceptar'),
                  onPressed: () => context.pop(),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y Diaglos')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FilledButton(
            child: const Text('Licencias usadas'),
            onPressed: () {
              showAboutDialog(context: context, children: [
                const Text(
                    'Magna incididunt aliqua excepteur non minim aute id voluptate consequat. Aliquip sit non magna reprehenderit laborum commodo excepteur labore cillum elit commodo irure. Sunt dolor tempor quis occaecat voluptate dolore ex id irure culpa. Et pariatur veniam quis nisi ut. Culpa anim sint sit proident reprehenderit ipsum cupidatat elit ex. Nisi ipsum ullamco ullamco ut.')
              ]);
            },
          ),
          FilledButton(
              child: const Text('Mostrar diálogo'),
              onPressed: () => openDialog(context)),
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
