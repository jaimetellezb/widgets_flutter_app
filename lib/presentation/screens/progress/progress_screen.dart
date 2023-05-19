import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicator'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Circular progress indicator'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(
            // el grueso de la línea
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
          SizedBox(
            height: 20,
          ),
          Text('Circular y Linear controlado'),
          SizedBox(
            height: 10,
          ),
          _ControllerProgressIndicator()
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    // El StreamBuilder es algo que se contruye en tiempo de ejecución
    // cuando el StreamBuilder ya no se utilice Flutter hace el dispose del mismo
    return StreamBuilder<double>(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile(
            (value) => value < 100), // hágalo hasta que se cumpla la condición
        builder: (context, snapshot) {
          // sino hay valir en el snapshot coloca cero
          final progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  backgroundColor: Colors.black12,
                ),
                const SizedBox(
                  width: 20,
                ),
                // el Expanded hace que su widget tome todo el espacio que tiene el padre
                Expanded(
                  child: LinearProgressIndicator(
                    value: progressValue,
                  ),
                )
              ],
            ),
          );
        });
  }
}
