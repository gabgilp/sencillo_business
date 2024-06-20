class Venta {
  final int id;
  final DateTime fecha;
  final int idVendedor;
  final int idCliente;
  final int idSucursal;
  final double monto;

  Venta({
    required this.id,
    required this.fecha,
    required this.idVendedor,
    required this.idCliente,
    required this.idSucursal,
    required this.monto,
  });
}
