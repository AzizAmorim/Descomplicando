import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logica.dart';
import 'dart:io';

class decisao extends StatefulWidget {
  const decisao({super.key});

  @override
  State<decisao> createState() => _decisaoState();
}

class _decisaoState extends State<decisao> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    //--------------------
    var modoDoBotao;
    if (VerifFim() && respFinal) {
      modoDoBotao = '  JOGAR \n DE NOVO';
    } else {
      modoDoBotao = '  VOLTAR \n AO JOGO';
    }
    var size = MediaQuery.of(context).size;
    VerifEstrelas();
    VerifPontos();
    //--------------------
    return Scaffold(
      //----------------------------------------------
      appBar: AppBar(
        backgroundColor: cor_B,
        //-----
        title: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Pontos: $pontos',
              style: TextStyle(
                fontFamily: fonte_A,
                fontSize: size.height * 0.07,
                color: cor_azul,
              ),
            ),
          ),
        ),
        //-----
      ),
      //------------------------------------------------------------------------------------------------------
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
                  height: constraints.maxWidth * 0.15,
                  child: estrelas,
                ),
                //----------------------------------------------
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                  width: constraints.maxWidth,
                ),
                //----------------------------------------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Selecione uma das opções abaixo',
                    style: TextStyle(
                      fontFamily: fonte_A,
                      fontSize: constraints.maxHeight * 0.1,
                      color: cor_C,
                    ),
                  ),
                ),
                //----------------------------------------------
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                  width: constraints.maxWidth,
                ),
                //----------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //----------------------------------------------
                    ElevatedButton(
                      onPressed: () {
                        exit(0);
                      },
                      //------
                      child: Text(
                        '    SAIR \n DO JOGO',
                        style: TextStyle(
                          fontFamily: fonte_A,
                          fontSize: constraints.maxHeight * 0.065,
                          color: cor_azul,
                        ),
                      ),
                      //------
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          backgroundColor: cor_B),
                    ),
                    //----------------------------------------------
                    ElevatedButton(
                      onPressed: () {
                        if (VerifFim() && respFinal) {
                          Limmpar();
                          CarregarPalavra();
                        }
                        Navigator.pushReplacementNamed(context, 'Jogo');
                      },
                      //------
                      child: Text(
                        modoDoBotao,
                        style: TextStyle(
                          fontFamily: fonte_A,
                          fontSize: constraints.maxHeight * 0.065,
                          color: cor_azul,
                        ),
                      ),
                      //------
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                          backgroundColor: cor_B),
                    ),
                    //----------------------------------------------
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'Menu');
                      },
                      //------
                      child: Text(
                        ' OUTRO\n  NIVEL',
                        style: TextStyle(
                          fontFamily: fonte_A,
                          fontSize: constraints.maxHeight * 0.065,
                          color: cor_azul,
                        ),
                      ),
                      //------
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(36, 10, 40, 10),
                          backgroundColor: cor_B),
                    ),
                    //----------------------------------------------
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
