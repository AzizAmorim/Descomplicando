import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logica.dart';

class capa extends StatefulWidget {
  const capa({super.key});

  @override
  State<capa> createState() => _capaState();
}

class _capaState extends State<capa> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    //--------------------
    var size = MediaQuery.of(context).size;
    VerifTema();
    //--------------------
    return Scaffold(
      backgroundColor: cor_A,
      body: Container(
        height: size.height,
        width: size.width,
        child: LayoutBuilder(
          builder: (_, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //----------------------------------------------
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                  width: constraints.maxWidth,
                ),
                //----------------------------------------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Descomplicando',
                    style: TextStyle(
                      fontFamily: fonte_B,
                      fontSize: constraints.maxHeight * 0.07,
                      color: cor_C,
                    ),
                  ),
                ),
                //----------------------------------------------
                SizedBox(
                  height: constraints.maxHeight * 0.4,
                  width: constraints.maxWidth,
                ),
                //----------------------------------------------
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'Menu');
                  },
                  //------
                  child: Text(
                    'J O G A R',
                    style: TextStyle(
                      fontFamily: fonte_B,
                      fontSize: constraints.maxHeight * 0.055,
                      color: cor_azul,
                    ),
                  ),
                  //------
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
