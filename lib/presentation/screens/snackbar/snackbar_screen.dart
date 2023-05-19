import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    // ocultar el snackbar anterior
    ScaffoldMessenger.of(context).clearSnackBars();

    final SnackBar snackBar = SnackBar(
      content: const Text('Hola Mundo'),
      // botón que hace x acción
      action: SnackBarAction(label: 'Ok', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    // mostrar snackbar
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      // Obligamos al usuario a seleccionar alguno de los botones
      // no se quita con el click fuera del dialog
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('¿Estás seguro?'),
        content: const Text(
            'Fugiat ad est commodo commodo esse dolor voluptate proident ipsum quis. Cillum quis laborum exercitation et reprehenderit nisi cupidatat tempor ut officia consectetur cupidatat eu voluptate. Eu reprehenderit proident duis commodo magna aliquip qui. Ad commodo duis duis cupidatat labore aliquip non incididunt fugiat. Sit commodo quis magna amet minim voluptate eiusmod ipsum ex.'),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text('Cancelar')),
          FilledButton(
              onPressed: () => context.pop(), child: const Text('Aceptar'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y díalogos'),
      ),
      body: Center(
        child: Column(
          children: [
            FilledButton.tonal(
              child: const Text('Licencias usadas'),
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      'ConsequatIn sit pariatur pariatur pariatur eiusmod pariatur ullamco excepteur mollit cillum velit enim deserunt. Eiusmod laboris amet ullamco labore proident ullamco sit. Incididunt consectetur enim commodo pariatur tempor. Dolore aute Lorem id ullamco quis velit exercitation dolor consequat mollit. veniam eu veniam id irure.')
                ]);
              },
            ),
            FilledButton.tonal(
              child: const Text('Mostrar díalogo'),
              onPressed: () => openDialog(context),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
