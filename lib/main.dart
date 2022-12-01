import 'package:flutter/material.dart';
import 'telas/capa.dart';
import 'telas/menu.dart';
import 'telas/jogo.dart';
import 'telas/decisao.dart';

main() {
  runApp(projeto());
}

class projeto extends StatelessWidget {
  const projeto({super.key});

  @override
  Widget build(BuildContext context) {
    //--------------------
    return MaterialApp(
      initialRoute: 'capa',
      routes: {
        'capa': (context) => capa(),
        'Menu': (context) => menu(),
        'Jogo': (context) => jogo(),
        'Decisao': (context) => decisao(),
      },
    );
  }
}
