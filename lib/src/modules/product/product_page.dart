import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Center(child: Text("Product Page")),
        ),
        body: Row(
          children: [
            Container(
              color: Colors.amber,
              width: MediaQuery.of(context).size.width * 0.2,
              child: NavigationListener(builder: (context, widget) {
                return Column(
                  children: [
                    ListTile(
                      title: Text('Red'),
                      selected: Modular.to.path.endsWith('/red'),
                      onTap: () {
                        Modular.to.navigate('./red');
                      },
                    ),
                    ListTile(
                      title: Text('Blue'),
                      selected: Modular.to.path.endsWith('/blue'),
                      onTap: () {
                        Modular.to.navigate('./blue');
                      },
                    ),
                    ListTile(
                      title: Text('Yellow'),
                      selected: Modular.to.path.endsWith('/yellow'),
                      onTap: () {
                        Modular.to.navigate('./yellow');
                      },
                    ),
                  ],
                );
              }),
            ),
            Expanded(
              child: RouterOutlet(),
            ),
          ],
        ));
  }
}
