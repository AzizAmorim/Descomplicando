import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logica.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    //--------------------
    var size = MediaQuery.of(context).size;
    Limmpar();
    //--------------------
    return Scaffold(
      backgroundColor: cor_A,
      body: Container(
        height: size.height,
        width: size.width,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //----------------------------------------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Selecione o Nivel \n  de Dificuldade',
                    style: TextStyle(
                      fontFamily: fonte_B,
                      fontSize: constraints.maxHeight * 0.065,
                      color: cor_C,
                    ),
                  ),
                ),
                //----------------------------------------------
                ElevatedButton.icon(
                  onPressed: () {
                    level = 'B';
                    CarregarNivel();
                    CarregarPalavra();
                    Navigator.pushReplacementNamed(context, 'Jogo');
                  },
                  //------
                  icon: estrela_B,
                  label: Text(
                    ' BAIXO ',
                    style: TextStyle(
                      fontFamily: fonte_A,
                      fontSize: constraints.maxHeight * 0.07,
                      color: Color.fromRGBO(0, 255, 0, 1.0),
                    ),
                  ),
                  //------
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      backgroundColor: cor_B),
                ),
                //----------------------------------------------
                ElevatedButton.icon(
                  onPressed: () {
                    level = 'M';
                    CarregarNivel();
                    CarregarPalavra();
                    Navigator.pushReplacementNamed(context, 'Jogo');
                  },
                  //------
                  icon: estrela_M,
                  label: Text(
                    ' MEDIO',
                    style: TextStyle(
                      fontFamily: fonte_A,
                      fontSize: constraints.maxHeight * 0.07,
                      color: Color.fromRGBO(255, 201, 14, 1.0),
                    ),
                  ),
                  //------
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      backgroundColor: cor_B),
                ),
                //----------------------------------------------
                ElevatedButton.icon(
                  onPressed: () {
                    level = 'A';
                    CarregarNivel();
                    CarregarPalavra();
                    Navigator.pushReplacementNamed(context, 'Jogo');
                  },
                  //------
                  icon: estrela_A,
                  label: Text(
                    '  ALTO  ',
                    style: TextStyle(
                      fontFamily: fonte_A,
                      fontSize: constraints.maxHeight * 0.07,
                      color: Color.fromRGBO(255, 0, 0, 1.0),
                    ),
                  ),
                  //------
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      backgroundColor: cor_B),
                ),
                //----------------------------------------------
              ],
            );
          },
        ),
      ),
    );
  }
}
