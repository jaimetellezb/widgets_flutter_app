import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatefulWidget {
  static const String name = 'buttons_screen';

  const ButtonsScreen({super.key});

  @override
  State<ButtonsScreen> createState() => _ButtonsScreenState();
}

class _ButtonsScreenState extends State<ButtonsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        // el wrap es similar a un Column o Row
        child: Wrap(
          spacing: 10, // agrega un espacio entre los widgets
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
            const ElevatedButton(
                onPressed: null, child: Text('Elevated disabled')),
            ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.access_alarm_rounded),
                label: const Text('Elevated Icon')),
            FilledButton(onPressed: () {}, child: const Text('Filled')),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save_alt_rounded),
                label: const Text('Filled Icon')),
            OutlinedButton(onPressed: () {}, child: const Text('Outlined')),
            OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.terminal),
                label: const Text('Outlined Icon')),
            TextButton(onPressed: () {}, child: const Text('Text')),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.telegram_rounded),
                label: const Text('Text Icon')),
            const _CustomButton(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.app_blocking)),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.app_blocking),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(colors.primary),
                  iconColor: MaterialStatePropertyAll(colors.background)),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // El ClipRRect nos sirve para poner bordes redondeados
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      child: Material(
        color: colors.primary,
        // el Inkwell hace que se vea una animación en el botón
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
