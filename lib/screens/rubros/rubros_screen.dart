import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sencillo_business/main.dart';

class RubrosScreen extends StatelessWidget {
  const RubrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.more_vert_rounded,
                color: Colors.white, size: 30),
            onPressed: () {},
          ),
          title: const Text(
            "Rubros",
            style: TextStyle(fontSize: 27),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                icon: const Icon(
                  Icons.shopping_cart_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () {},
              ),
            )
          ]),
      body: const Center(
        child: _RubrosView(),
      ),
    );
  }
}

class _RubrosView extends StatelessWidget {
  const _RubrosView();

  @override
  Widget build(BuildContext context) {
    final rubros = MainApp.jsonResponse['rubros'];
    return ListView.builder(
      itemCount: (rubros.length % 2 == 0)
          ? rubros.length ~/ 2
          : rubros.length ~/ 2 + 1,
      itemBuilder: (context, index) {
        if (index * 2 + 1 >= rubros.length) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_RubrosCelda(nombre: rubros[index * 2]['nombre'])]);
        }
        return Row(
          children: [
            _RubrosCelda(nombre: rubros[index * 2]['nombre']),
            _RubrosCelda(nombre: rubros[index * 2 + 1]['nombre']),
          ],
        );
      },
    );
  }
}

class _RubrosCelda extends StatelessWidget {
  final String nombre;
  const _RubrosCelda({required this.nombre});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/productos/$nombre',
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
            width: 179,
            height: 179,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Center(
              child: Text(
                nombre,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            )),
      ),
    );
  }
}
