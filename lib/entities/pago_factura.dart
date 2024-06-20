class PagoFactura {
  final int id;
  final int idVenta;
  final String metodoPago;
  final String referencia;
  final double monto;

  PagoFactura({
    required this.id,
    required this.idVenta,
    required this.metodoPago,
    required this.referencia,
    required this.monto,
  });
}
