class DetalleFactura {
  final int id;
  final int idVenta;
  final int idProducto;
  final int cantidad;
  final double precioUnitario;
  final double total;

  DetalleFactura({
    required this.id,
    required this.idVenta,
    required this.idProducto,
    required this.cantidad,
    required this.precioUnitario,
    required this.total,
  });
}
