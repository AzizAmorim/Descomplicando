import 'package:flutter/material.dart';
import '../niveis_jogo.dart';
import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

//-------------------- G L O B A L ------------------------------------------------
String fonte_A = "Arial";
String fonte_B = "ArialBold";
Color cor_branca = Color.fromRGBO(255, 255, 255, 1.0);
Color cor_azul = Color.fromRGBO(0, 144, 231, 1.0);

Color cor_A = Color(1);
Color cor_B = Color(1);
Color cor_C = Color(1);
//------ MENU ------
Image estrela_B = Image.asset('assets/images/menu/rank_vazio.png');
Image estrela_M = Image.asset('assets/images/menu/rank_vazio.png');
Image estrela_A = Image.asset('assets/images/menu/rank_vazio.png');

int pontos_B = 0;
int pontos_M = 0;
int pontos_A = 0;
//------ JOGO ------
int pontos = 0;
List jogado = []; //Guarda quais palavras já foram usadas
List nivel = []; //Guarda a lista de palavras
bool respFinal = false; //Se a ultima resposta da lista foi respondida
String level = "?"; //Para saber em qual nivel estão jogando

int palavraNumero = -1;
int opc_1 = -1;
int opc_2 = -1;
int opc_3 = -1;

bool tema = false; //para mudar para o tema escuro ou claro
bool audio = true; //para ativar/desativar os efeitos sonoros
//------ DECISAO ------
Image estrelas = Image.asset('assets/images/decisao/pontos_vazio.png');

Image icone_tema = Image.asset('assets/images/decisao/icone_lua.png');
Image icone_audio = Image.asset('assets/images/decisao/icone_som.png');
Image icone_dica = Image.asset('assets/images/decisao/icone_dica.png');
//-------------------- G L O B A L ------------------------------------------------

//-------------------- M E N U ----------------------------------------------------
//----------------------------------------------
void VerifPontos() {
  if (level == 'B' && pontos > pontos_B) {
    pontos_B = pontos;
    VerifEstrela_B();
  } else if (level == 'M' && pontos > pontos_M) {
    pontos_M = pontos;
    VerifEstrela_M();
  } else if (level == 'A' && pontos > pontos_A) {
    pontos_A = pontos;
    VerifEstrela_A();
  }
}

//--------------------
void VerifEstrela_B() {
  if (pontos_B > 0 && pontos_B <= 60) {
    estrela_B = Image.asset('assets/images/menu/rank_bronze.png');
  } else if (pontos_B > 60 && pontos_B <= 120) {
    estrela_B = Image.asset('assets/images/menu/rank_prata.png');
  } else if (pontos_B > 120) {
    estrela_B = Image.asset('assets/images/menu/rank_ouro.png');
  }
}

void VerifEstrela_M() {
  if (pontos_M > 0 && pontos_M <= 60) {
    estrela_M = Image.asset('assets/images/menu/rank_bronze.png');
  } else if (pontos_M > 60 && pontos_M <= 120) {
    estrela_M = Image.asset('assets/images/menu/rank_prata.png');
  } else if (pontos_M > 120) {
    estrela_M = Image.asset('assets/images/menu/rank_ouro.png');
  }
}

void VerifEstrela_A() {
  if (pontos_A > 0 && pontos_A <= 60) {
    estrela_A = Image.asset('assets/images/menu/rank_bronze.png');
  } else if (pontos_A > 60 && pontos_A <= 120) {
    estrela_A = Image.asset('assets/images/menu/rank_prata.png');
  } else if (pontos_A > 120) {
    estrela_A = Image.asset('assets/images/menu/rank_ouro.png');
  }
}

//----------------------------------------------
void CarregarNivel() {
  if (level == 'B') {
    nivel = baixo;
  } else if (level == 'M') {
    nivel = medio;
  } else {
    nivel = alto;
  } //Level == 'A'
}

//----------------------------------------------
//-------------------- M E N U ----------------------------------------------------

//-------------------- J O G O ----------------------------------------------------
//----------------------------------------------
void CarregarPalavra() {
  bool verif;
  do {
    palavraNumero = Random().nextInt(14);
    verif = false;
    if (jogado.isEmpty) {
    } else {
      for (int index = 1; index <= jogado.length; index++) {
        if (jogado[index - 1] == palavraNumero) {
          verif = true;
          break;
        }
      }
    }
  } while (verif);
  jogado.add(palavraNumero);
  CarregarRespostas();
}

//----------------------------------------------
void CarregarRespostas() {
  bool verif;

  opc_1 = Random().nextInt(3);
  opc_2 = Random().nextInt(3);
  do {
    verif = false;
    if (opc_1 == opc_2) {
      opc_2 = Random().nextInt(3);
      verif = true;
    }
  } while (verif);

  if (opc_1 == 1 && opc_2 == 2 || opc_1 == 2 && opc_2 == 1) {
    opc_3 = 0;
  } else if (opc_1 == 0 && opc_2 == 2 || opc_1 == 2 && opc_2 == 0) {
    opc_3 = 1;
  } else {
    opc_3 = 2;
  }
}

//----------------------------------------------
void VerifResp(int b) {
  final player = AudioPlayer();
  player.stop();
  if (b == nivel[palavraNumero]['correta']) {
    if (audio) {
      player.play(AssetSource('sounds/som_acertou.m4a'));
    }
    pontos = pontos + 10;
  } else {
    if (audio) {
      player.play(AssetSource('sounds/som_errou.m4a'));
    }
    if (level == 'B') {
      pontos = pontos + 5;
    } else if (level == 'M') {
      pontos = pontos + 3;
    }
  }
}

//----------------------------------------------
bool VerifFim() {
  bool r;
  if (jogado.length == nivel.length) {
    r = true;
  } else {
    r = false;
  }
  return r;
}

//----------------------------------------------
void VerifTema() {
  if (tema) {
    cor_A = Color.fromRGBO(40, 40, 40, 1.0);
    cor_B = Color.fromRGBO(20, 20, 20, 1.0);
    cor_C = Color.fromRGBO(0, 144, 231, 1.0);

    if (pontos_B == 0) {
      estrela_B = Image.asset('assets/images/menu/rank_vazio_E.png');
    }
    if (pontos_M == 0) {
      estrela_M = Image.asset('assets/images/menu/rank_vazio_E.png');
    }
    if (pontos_A == 0) {
      estrela_A = Image.asset('assets/images/menu/rank_vazio_E.png');
    }
    if (pontos == 0) {
      estrelas = Image.asset('assets/images/decisao/pontos_vazio_E.png');
    }
    //------
  } else {
    cor_A = Color.fromRGBO(0, 144, 231, 1.0);
    cor_B = Color.fromRGBO(0, 46, 72, 1.0);
    cor_C = Color.fromRGBO(0, 46, 72, 1.0);

    if (pontos_B == 0) {
      estrela_B = Image.asset('assets/images/menu/rank_vazio.png');
    }
    if (pontos_M == 0) {
      estrela_M = Image.asset('assets/images/menu/rank_vazio.png');
    }
    if (pontos_A == 0) {
      estrela_A = Image.asset('assets/images/menu/rank_vazio.png');
    }
    if (pontos == 0) {
      estrelas = Image.asset('assets/images/decisao/pontos_vazio.png');
    }
  }
}

//----------------------------------------------
void BotaoTema() {
  if (tema) {
    icone_tema = Image.asset('assets/images/decisao/icone_sol.png');
  } else {
    icone_tema = Image.asset('assets/images/decisao/icone_lua.png');
  }
}

void BotaoAudio() {
  if (audio) {
    icone_audio = Image.asset('assets/images/decisao/icone_som.png');
  } else {
    icone_audio = Image.asset('assets/images/decisao/icone_mudo.png');
  }
}

//----------------------------------------------
//-------------------- J O G O ----------------------------------------------------

//-------------------- D E C I S A O ----------------------------------------------
//----------------------------------------------
void VerifEstrelas() {
  final player = AudioPlayer();
  if (pontos == 0) {
    if (tema) {
      estrelas = Image.asset('assets/images/decisao/pontos_vazio_E.png');
    } else {
      estrelas = Image.asset('assets/images/decisao/pontos_vazio.png');
    }
  } else if (pontos > 0 && pontos <= 60) {
    if (audio) {
      player.play(AssetSource('sounds/som_bronze.m4a'));
    }
    if (tema) {
      estrelas = Image.asset('assets/images/decisao/pontos_bronze_E.png');
    } else {
      estrelas = Image.asset('assets/images/decisao/pontos_bronze.png');
    }
  } else if (pontos > 60 && pontos <= 120) {
    if (audio) {
      player.play(AssetSource('sounds/som_prata.m4a'));
    }
    if (tema) {
      estrelas = Image.asset('assets/images/decisao/pontos_prata_E.png');
    } else {
      estrelas = Image.asset('assets/images/decisao/pontos_prata.png');
    }
  } else if (pontos > 120) {
    if (audio) {
      player.play(AssetSource('sounds/som_ouro.m4a'));
    }
    estrelas = Image.asset('assets/images/decisao/pontos_ouro.png');
  }
}

//----------------------------------------------
void Limmpar() {
  pontos = 0;
  jogado.clear();
  respFinal = false;
}
//----------------------------------------------
//-------------------- D E C I S A O ----------------------------------------------