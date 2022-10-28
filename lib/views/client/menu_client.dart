import 'package:app_bank/models/utils/routes.dart';
import 'package:app_bank/views/components/credit-card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MenuClient extends StatefulWidget {
  const MenuClient({super.key});

  @override
  State<MenuClient> createState() => _MenuClientState();
}

class _MenuClientState extends State<MenuClient> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final alturaTela = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom);
    final padding = MediaQuery.of(context).padding;
    final espacamento = EdgeInsets.only(
      top: size.height * .01,
      bottom: size.height * .01,
    );
    final iconCards = [
      "assets/icons/hipercard-logo.png",
      "assets/icons/mastercard-logo.png",
      "assets/icons/visa-logo.png",
      "assets/icons/american_express-logo.png",
      "assets/icons/elo-logo.png",
    ];
    final titles = [
      "Cadastrar Cartão",
      "Solicitar Cartão",
    ];
    String name = "Lucas Silva Correa";
    String cardNumber = "3799 3799 3799 3799";
    String expires = "10/28";
    String cvc = "001";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: size.height * .10,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () {
                Navigator.pushNamed(context, Routes.EDIT_PROFILE);
              },
              icon: const CircleAvatar(
                radius: 30,
                backgroundColor: Color(0xffB938E0),
                child: Text(
                  "LS",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: padding,
        child: Stack(
          children: [
            Container(
              height: alturaTela,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * .05),
                    child: SizedBox(
                      width: size.width * .80,
                      child: const AutoSizeText(
                        "Bem-vindo(a), Lucas.",
                        maxLines: 1,
                        minFontSize: 10,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .80,
                    child: const AutoSizeText(
                      "Meus cartões",
                      maxLines: 1,
                      minFontSize: 10,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .30,
                    width: size.width,
                    child: CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                        return CreditCard(
                            onpressed: () {
                              _mostrarBottomSheet(context);
                            },
                            cardIcon: iconCards[index],
                            cardNumber: cardNumber,
                            name: name,
                            expires: expires,
                            cvc: cvc);
                      },
                      itemCount: 5,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        aspectRatio: 16 / 9,
                        height: size.height * .25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * .02,
                      bottom: size.height * .02,
                    ),
                    child: SizedBox(
                      height: size.height * .24,
                      width: size.width * .90,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: espacamento,
                            child: SizedBox(
                              height: size.height * .10,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  index == 0
                                      ? Navigator.pushNamed(
                                          context, Routes.ADD_CREDIT_CARD)
                                      : Navigator.pushNamed(
                                          context, Routes.REQUEST_CREDIT_CARD);
                                },
                                icon: Icon(
                                  index == 0
                                      ? Icons.add_card
                                      : Icons.credit_card,
                                  color: Colors.white,
                                ),
                                label: AutoSizeText(
                                  titles[index],
                                  maxLines: 1,
                                  minFontSize: 10,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffB938E0),
                                ),
                              ),
                            ),
                          );
                        },
                        padding: const EdgeInsets.all(0),
                        itemCount: titles.length,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  dynamic _mostrarBottomSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const espacamento = EdgeInsets.only(top: 5, bottom: 5);
    return Scaffold.of(context).showBottomSheet(
      backgroundColor: Colors.white,
      elevation: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        side: BorderSide(
          color: Colors.black,
          width: 2,
        ),
      ),
      enableDrag: true,
      (context) => SizedBox(
        height: size.height * .50,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Center(
                  child: SizedBox(
                    height: size.height * .08,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            height: size.height * .01,
                            width: size.width * .15,
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: size.height * .02,
                          ),
                          child: SizedBox(
                            width: size.width * .90,
                            child: const AutoSizeText(
                              "Informações do Cartão",
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: SizedBox(
                    width: size.width * .90,
                    height: size.height * .30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: espacamento,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: AutoSizeText(
                                      "Nome no cartão",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                  AutoSizeText(
                                    "Lucas Silva Correa",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: AutoSizeText(
                                    "Número do cartão",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                AutoSizeText(
                                  "3799 3799 3799 3799",
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.copy),
                              label: const Text("Copiar"),
                            ),
                          ],
                        ),
                        Padding(
                          padding: espacamento,
                          child: SizedBox(
                            width: size.width * .40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    AutoSizeText(
                                      "CVC",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    AutoSizeText(
                                      "001",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    AutoSizeText(
                                      "Validade",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    AutoSizeText(
                                      "10/28",
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                AutoSizeText(
                                  "Função",
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                AutoSizeText(
                                  "Débito e Crédito",
                                  maxLines: 1,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * .02),
                    child: SizedBox(
                      width: size.width * .90,
                      height: size.height * .06,
                      child: OutlinedButton(
                        onPressed: () {
                          _confirmationShowDialog();
                        },
                        child: const AutoSizeText(
                          "Excluir cartão",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  dynamic _confirmationShowDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text(
            "Deseja mesmo excluir este cartão?",
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text(
                "Sim",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Não",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // TextFormField(
  //   decoration: InputDecoration(
  //     filled: true,
  //     fillColor: Colors.grey[150],
  //   ),
  // ),

  // dynamic _mostrarOpcao(BuildContext context) {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => AlertDialog(content: Builder(
  //       builder: (context) {
  //         return SizedBox();
  //       },
  //     )),
  //   );
  // }
}
