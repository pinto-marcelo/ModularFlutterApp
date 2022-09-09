import 'package:ab_certus/src/modules/product/product_page.dart';
import 'package:ab_certus/src/modules/product/views/list_product_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (__, _) => const ProductPage(),
          children: [
            ChildRoute(
              '/red',
              child: ((_, __) => Container(
                    color: Colors.red,
                  )),
            ),
            ChildRoute(
              '/blue',
              child: ((_, __) => Container(
                    color: Colors.blue,
                  )),
            ),
            ChildRoute(
              '/yellow',
              child: ((_, __) => Container(
                    color: Colors.yellow,
                  )),
            ),
          ],
        ),
        ChildRoute('/list',
            child: (_, args) => ListProductPage(
                  id: args.queryParams['id'] ?? '',
                ),
            transition: TransitionType.rotate,
            duration: const Duration(seconds: 1)),
      ];
}
