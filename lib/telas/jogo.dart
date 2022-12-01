import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logica.dart';

class jogo extends StatefulWidget {
  const jogo({super.key});

  @override
  State<jogo> createState() => _jogoState();
}

class _jogoState extends State<jogo> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  @override
  Widget build(BuildContext context) {
    //--------------------
    var size = MediaQuery.of(context).size;
    //--------------------
    return Scaffold(
      //----------------------------------------------
      appBar: AppBar(
        backgroundColor: cor_B,
        //-----
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, 'Decisao');
            },
            iconSize: size.height * 0.1,
            icon: Image.asset('assets/images/decisao/icone_A.png')),
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
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              iconSize: size.height * 0.1,
              icon: Image.asset('assets/images/decisao/icone_B.png'),
            );
          }),
        ],
        //-----
      ),
      //----------------------------------------------
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(0, 0, 0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //----------------------------------------------
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  if (audio) {
                    audio = false;
                  } else {
                    audio = true;
                  }
                  BotaoAudio();
                });
              },
              //------
              icon: icone_audio,
              label: Text(
                ' AUDIO',
                style: TextStyle(
                  fontFamily: fonte_A,
                  fontSize: size.height * 0.1,
                  color: cor_branca,
                ),
              ),
              //------
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  backgroundColor: cor_A),
            ),
            //----------------------------------------------
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  if (tema) {
                    tema = false;
                  } else {
                    tema = true;
                  }
                  VerifTema();
                  BotaoTema();
                });
              },
              //------
              icon: icone_tema,
              label: Text(
                ' TEMA ',
                style: TextStyle(
                  fontFamily: fonte_A,
                  fontSize: size.height * 0.1,
                  color: cor_branca,
                ),
              ),
              //------
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                  backgroundColor: cor_A),
            ),
            //----------------------------------------------
          ],
        ),
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
                  height: constraints.maxHeight * 0.03,
                  width: constraints.maxWidth,
                ),
                //----------------------------------------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    nivel[palavraNumero]['palavra'],
                    style: TextStyle(
                      fontFamily: fonte_A,
                      fontSize: constraints.maxHeight * 0.23,
                      color: cor_C,
                    ),
                  ),
                ),
                //----------------------------------------------
                SizedBox(
                  height: constraints.maxHeight * 0.2,
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
                        VerifResp(opc_1);
                        if (VerifFim()) {
                          respFinal = true;
                          Navigator.pushReplacementNamed(context, 'Decisao');
                        } else {
                          setState(() {
                            CarregarPalavra();
                          });
                        }
                      },
                      //------
                      child: Text(
                        nivel[palavraNumero]['resposta'][opc_1],
                        style: TextStyle(
                          fontFamily: fonte_A,
                          fontSize: constraints.maxHeight * 0.15,
                          color: cor_azul,
                        ),
                      ),
                      //------
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          backgroundColor: cor_B),
                    ),
                    //----------------------------------------------
                    ElevatedButton(
                      onPressed: () {
                        VerifResp(opc_2);
                        if (VerifFim()) {
                          respFinal = true;
                          Navigator.pushReplacementNamed(context, 'Decisao');
                        } else {
                          setState(() {
                            CarregarPalavra();
                          });
                        }
                      },
                      //------
                      child: Text(
                        nivel[palavraNumero]['resposta'][opc_2],
                        style: TextStyle(
                          fontFamily: fonte_A,
                          fontSize: constraints.maxHeight * 0.15,
                          color: cor_azul,
                        ),
                      ),
                      //------
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          backgroundColor: cor_B),
                    ),
                    //----------------------------------------------
                    ElevatedButton(
                      onPressed: () {
                        VerifResp(opc_3);
                        if (VerifFim()) {
                          respFinal = true;
                          Navigator.pushReplacementNamed(context, 'Decisao');
                        } else {
                          setState(() {
                            CarregarPalavra();
                          });
                        }
                      },
                      //------
                      child: Text(
                        nivel[palavraNumero]['resposta'][opc_3],
                        style: TextStyle(
                          fontFamily: fonte_A,
                          fontSize: constraints.maxHeight * 0.15,
                          color: cor_azul,
                        ),
                      ),
                      //------
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
