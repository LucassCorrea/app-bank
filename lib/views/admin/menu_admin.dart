import 'package:app_bank/models/utils/routes.dart';
import 'package:app_bank/views/components/button_appBar.dart';
import 'package:app_bank/views/components/elevated-button_card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:brasil_fields/brasil_fields.dart';

enum Menu { itemOne, itemTwo, itemThree }

class MenuAdmin extends StatefulWidget {
  const MenuAdmin({super.key});

  @override
  State<MenuAdmin> createState() => _MenuAdminState();
}

class _MenuAdminState extends State<MenuAdmin> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final alturaTela = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom);
    final padding = MediaQuery.of(context).padding;
    final titles = [
      "Aprovação\nCartão Novo",
      "Aprovação de\nCadastro do Cartão",
    ];
    final clientes = [
      "Ana Laura",
      "Boris",
      "Claúdia",
      "Daniele",
      "Everaldo",
      "Fernanda",
      "Gabriel",
      "Hole",
      "Iara",
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        toolbarHeight: size.height * .10,
        leading: ButtonAppBar(
          onpressed: () => Navigator.pop(context),
        ),
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
                    padding: EdgeInsets.only(top: size.height * .10),
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
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * .05,
                      bottom: size.height * .03,
                    ),
                    child: SizedBox(
                      height: size.height * .15,
                      width: size.width * .80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          for (int index = 0; index < 2; index++)
                            SizedBox(
                              height: size.height * .15,
                              width: size.width * .38,
                              child: ElevatedButtonCard(
                                text: titles[index],
                                color: Colors.white,
                                colorBorder: const Color(0xffB938E0),
                                icon: Icons.credit_card,
                                onpressed: () {
                                  index == 0
                                      ? Navigator.pushNamed(
                                          context, Routes.APPROVAL_CREDIT_CARD)
                                      : Navigator.pushNamed(context,
                                          Routes.REGISTRATION_CREDIT_CARD);
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AutoSizeText(
                          "Clientes",
                          maxLines: 1,
                          minFontSize: 1,
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                          onPressed: () => _showPopUp(),
                          icon: const Icon(
                            Icons.filter_list,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .02),
                    child: SizedBox(
                      height: size.height * .50,
                      width: size.width * .90,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: const BorderSide(
                                color: Colors.black,
                              ),
                            ),
                            child: ListTile(
                              title: Text(
                                clientes[index],
                              ),
                              iconColor: const Color(0xffB938E0),
                              autofocus: true,
                              onTap: () {},
                              onLongPress: () {},
                              leading: const Icon(Icons.person),
                            ),
                          );
                        },
                        padding: const EdgeInsets.all(0),
                        itemCount: clientes.length,
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

  dynamic _showPopUp() {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: Colors.white,
        content: Builder(builder: (context) {
          final size = MediaQuery.of(context).size;
          final espacamento = EdgeInsets.only(
            top: size.height * .01,
            bottom: size.height * .01,
          );
          final titles = [
            "Estado",
            "Quantidade de cartões",
            "Ordem alfabética",
          ];
          final quantCartoes = [
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
          ];
          final ordemAlfabetica = ["a-z", "z-a"];

          return SizedBox(
            height: size.height * .50,
            width: size.width * .90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * .70,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "Filtrar por:",
                      maxLines: 1,
                      minFontSize: 10,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * .02,
                    bottom: size.height * .03,
                  ),
                  child: SizedBox(
                    height: size.height * .30,
                    width: size.width * .70,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: espacamento,
                          child: index == 0
                              ? SizedBox(
                                  height: size.height * .08,
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                      label: AutoSizeText(
                                        titles[index],
                                      ),
                                    ),
                                    items: Estados.listaEstados
                                        .map(
                                          (String estado) => DropdownMenuItem(
                                            value: estado,
                                            child: AutoSizeText(estado),
                                          ),
                                        )
                                        .toList(),
                                    onChanged: (estadoSelecionado) =>
                                        setState(() {}),
                                  ),
                                )
                              : index == 1
                                  ? SizedBox(
                                      height: size.height * .08,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          label: AutoSizeText(
                                            titles[index],
                                          ),
                                        ),
                                        items: quantCartoes
                                            .map(
                                              (String valueQuant) =>
                                                  DropdownMenuItem(
                                                value: valueQuant,
                                                child: AutoSizeText(valueQuant),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (quantSelecionada) =>
                                            setState(() {}),
                                      ),
                                    )
                                  : SizedBox(
                                      height: size.height * .08,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          label: AutoSizeText(
                                            titles[index],
                                          ),
                                        ),
                                        items: ordemAlfabetica
                                            .map(
                                              (String valueOrdem) =>
                                                  DropdownMenuItem(
                                                value: valueOrdem,
                                                child: AutoSizeText(valueOrdem),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (quantSelecionada) =>
                                            setState(() {}),
                                      ),
                                    ),
                        );
                      },
                      padding: const EdgeInsets.all(0),
                      itemCount: titles.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .07,
                  width: size.width * .70,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xffB938E0)),
                    child: const AutoSizeText(
                      'Confirmar',
                      maxLines: 1,
                      minFontSize: 10,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
