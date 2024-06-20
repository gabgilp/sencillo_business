import 'package:flutter/material.dart';
import 'package:sencillo_business/main.dart';

class ProductosScreen extends StatelessWidget {
  final String nombre;
  const ProductosScreen({required this.nombre, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.more_vert_rounded,
                color: Colors.white, size: 30),
            onPressed: () {},
          ),
          title: Text(
            nombre,
            style: const TextStyle(fontSize: 27),
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
      body: Center(
        child: _ProductosView(nombre: nombre),
      ),
    );
  }
}

class _ProductosView extends StatelessWidget {
  final String nombre;
  const _ProductosView({required this.nombre});

  @override
  Widget build(BuildContext context) {
    final idRubro = MainApp.jsonResponse['rubros']
        .indexWhere((element) => element['nombre'] == nombre);

    final productos = MainApp.jsonResponse["productos"]
        .where((product) => product['idRubro'] == idRubro)
        .toList();

    return ListView.builder(
        itemCount: (productos.length % 2 == 0)
            ? productos.length ~/ 2
            : productos.length ~/ 2 + 1,
        itemBuilder: (context, index) {
          if (index * 2 + 1 >= productos.length) {
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              _ProductosCelda(
                  nombre: productos[index * 2]['nombre'],
                  precio: productos[index * 2]['precio'].toDouble())
            ]);
          }
          return Row(
            children: [
              _ProductosCelda(
                  nombre: productos[index * 2]['nombre'],
                  precio: productos[index * 2]['precio'].toDouble()),
              _ProductosCelda(
                  nombre: productos[index * 2 + 1]['nombre'],
                  precio: productos[index * 2 + 1]['precio'].toDouble())
            ],
          );
        });
  }
}

class _ProductosCelda extends StatelessWidget {
  final String nombre;
  final double precio;
  const _ProductosCelda({required this.nombre, required this.precio});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.push(
        //   '/productos/$nombre',
        // );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              nombre,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              '\$$precio',
              style: const TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
