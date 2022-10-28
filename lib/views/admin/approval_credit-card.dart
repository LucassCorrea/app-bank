// ignore_for_file: file_names, unused_local_variable

import 'package:app_bank/views/components/button_appBar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';

class ApprovalCreditCard extends StatefulWidget {
  const ApprovalCreditCard({super.key});

  @override
  State<ApprovalCreditCard> createState() => _ApprovalCreditCardState();
}

class _ApprovalCreditCardState extends State<ApprovalCreditCard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final alturaTela = MediaQuery.of(context).size.height -
        (MediaQuery.of(context).padding.top +
            MediaQuery.of(context).padding.bottom);
    final padding = MediaQuery.of(context).padding;
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
        leading: ButtonAppBar(
          onpressed: () => Navigator.pop(context),
        ),
        toolbarHeight: size.height * .10,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: padding,
        child: Stack(
          children: [
            Container(
              height: alturaTela,
              width: size.width,
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .10),
                    child: SizedBox(
                      width: size.width * .80,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "Aprovação de Novo Cartão",
                          maxLines: 1,
                          minFontSize: 10,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: size.height * .03,
                      bottom: size.height * .03,
                    ),
                    child: Column(
                      children: [
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
                          padding: EdgeInsets.only(
                            top: size.height * .02,
                            bottom: size.height * .03,
                          ),
                          child: SizedBox(
                            height: size.height * .60,
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
                                    onTap: () {
                                      _showInformation(clientes[index]);
                                    },
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
          String valorQuant = "", valorOrdem = "";
          final ordemAlfabetica = ["a-z", "z-a"];
          String valorInicial = "";

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
                                        setState(() {
                                      valorInicial =
                                          estadoSelecionado.toString();
                                    }),
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
                                            setState(() {
                                          valorQuant =
                                              quantSelecionada.toString();
                                        }),
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
                                            setState(() {
                                          valorInicial =
                                              quantSelecionada.toString();
                                        }),
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

  dynamic _showInformation(String name) {
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
            "Aprovado",
            "Reprovado",
          ];
          bool reprovado = false;
          String valorInicial = "";

          return SizedBox(
            height: size.height * .50,
            width: size.width * .90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AutoSizeText(
                      "Nome:",
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
                    AutoSizeText(
                      name,
                      maxLines: 1,
                      minFontSize: 10,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: size.height * .01,
                    bottom: size.height * .01,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width * .35,
                        child: const AutoSizeText(
                          "Função do cartão:",
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
                      SizedBox(
                        width: size.width * .30,
                        child: const AutoSizeText(
                          "Débito e Crédito",
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
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .10,
                  width: size.width * .70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * .20,
                        child: const Align(
                          alignment: Alignment.centerLeft,
                          child: AutoSizeText(
                            "Status:",
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
                        height: size.height * .08,
                        width: size.width * .45,
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                            label: AutoSizeText(
                              "Status",
                            ),
                          ),
                          items: titles
                              .map(
                                (valueItem) => DropdownMenuItem(
                                  value: valueItem,
                                  child: AutoSizeText(valueItem),
                                ),
                              )
                              .toList(),
                          onChanged: (newValue) => setState(() {
                            valorInicial = newValue.toString();
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .20,
                  width: size.width * .70,
                  child: TextFormField(
                    maxLines: 5,
                    decoration: const InputDecoration(
                      labelText: "Justificativa",
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
