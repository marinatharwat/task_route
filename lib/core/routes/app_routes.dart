import 'package:flutter/material.dart';
import 'package:flutter_task/feature/home/presentation/screens/product_screen.dart';



class Routes {
  static const String initialRoute = '/';


}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const ProductScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Not Found..!'),
            ),
          ),
        );
    }
  }
}
