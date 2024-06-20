import 'package:sencillo_business/entities/detalle_factura.dart';

class Factura {
  List<DetalleFactura>? detalles;
  DateTime? fecha;
  double? total;

  Factura({this.detalles, this.fecha, this.total});

  double calcularTotal() {
    double total = 0;
    detalles?.forEach((detalle) {
      total += detalle.calcularSubtotal();
    });
    return total;
  }

  void agregarDetalle(DetalleFactura detalle) {
    if (detalles == null) {
      detalles = [detalle];
    } else {
      detalles!.add(detalle);
    }
  }

  void setFecha(DateTime fecha) {
    this.fecha = fecha;
  }
}
