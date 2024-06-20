import 'package:go_router/go_router.dart';
import 'package:sencillo_business/screens/screens.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(path: '/', builder: (context, state) => const RubrosScreen()),
  GoRoute(
      path: '/productos/:nombre',
      builder: (context, state) {
        final nombre = state.pathParameters['nombre'];
        return ProductosScreen(nombre: nombre ?? '');
      }),
]);
