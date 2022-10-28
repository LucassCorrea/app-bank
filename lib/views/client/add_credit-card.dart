// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:app_bank/models/utils/routes.dart';
import 'package:app_bank/views/components/button_appBar.dart';
import 'package:app_bank/views/components/credit-card.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class AddCreditCard extends StatefulWidget {
  const AddCreditCard({super.key});

  @override
  State<AddCreditCard> createState() => _AddCreditCardState();
}

class _AddCreditCardState extends State<AddCreditCard> {
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
    final titles = [
      "Nome completo",
      "Número do cartão",
      "Tipo do cartão",
      "Data de Validade",
      "CVC",
    ];
    String pegarData() {
      final DateFormat formatter = DateFormat('MM/yy');
      final String formatted = formatter.format(DateTime.now());
      return formatted;
    }

    final List itens = [
      " ",
      "Crédito",
      "Débito",
      "Poupança",
      "Multifuncional (Crédito e Débito)",
      "Multifuncional (Poupança e Débito)",
    ];

    String name = "";
    String cardNumber = "";
    String expires = "";
    String cvc = "";

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: ButtonAppBar(
          onpressed: () => Navigator.pop(context),
        ),
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
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: size.height * .02),
                    child: SizedBox(
                      width: size.width * .80,
                      child: const Align(
                        alignment: Alignment.centerLeft,
                        child: AutoSizeText(
                          "Cadastrar Cartão",
                          maxLines: 1,
                          minFontSize: 10,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .30,
                    child: CarouselSlider.builder(
                      itemBuilder: (context, index, realIndex) {
                        return CreditCard(
                          onpressed: () {},
                          cardIcon: "assets/icons/mastercard-logo.png",
                          cardNumber: cardNumber,
                          name: name,
                          expires: expires,
                          cvc: cvc,
                        );
                      },
                      itemCount: 1,
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        initialPage: 0,
                        enableInfiniteScroll: false,
                        aspectRatio: 16 / 9,
                        height: size.height * .25,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .40,
                    width: size.width * .85,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: espacamento,
                          child: (index == 0 || index == 1)
                              ? SizedBox(
                                  height: size.height * .08,
                                  child: TextFormField(
                                    inputFormatters: index == 0
                                        ? []
                                        : [
                                            CartaoBancarioInputFormatter(),
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                    onChanged: (String value) async {
                                      setState(() {
                                        index == 0
                                            ? name = value
                                            : cardNumber = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      label: AutoSizeText(
                                        titles[index],
                                      ),
                                    ),
                                  ),
                                )
                              : index == 2
                                  ? SizedBox(
                                      height: size.height * .08,
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                          label: AutoSizeText(
                                            titles[index],
                                          ),
                                        ),
                                        items: itens
                                            .map(
                                              (valueItem) => DropdownMenuItem(
                                                value: valueItem,
                                                child: AutoSizeText(valueItem),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (newValue) =>
                                            setState(() {}),
                                      ),
                                    )
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: size.height * .08,
                                          width: size.width * .41,
                                          child: TextFormField(
                                            inputFormatters: [
                                              ValidadeCartaoInputFormatter(),
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            onChanged: (value) {
                                              setState(() {
                                                expires = value;
                                              });
                                            },
                                            initialValue: pegarData(),
                                            decoration: InputDecoration(
                                              label: AutoSizeText(
                                                titles[index],
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: size.height * .08,
                                          width: size.width * .41,
                                          child: TextFormField(
                                            inputFormatters: [
                                              FilteringTextInputFormatter
                                                  .digitsOnly,
                                            ],
                                            maxLength: 3,
                                            onChanged: (value) {
                                              setState(() {
                                                cvc = value;
                                              });
                                            },
                                            decoration: InputDecoration(
                                              counterText: '',
                                              label: AutoSizeText(
                                                titles[index + 1],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                        );
                      },
                      padding: const EdgeInsets.all(0),
                      itemCount: 4,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .03),
                    child: SizedBox(
                      height: size.height * .07,
                      width: size.width * .70,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.MENU_CLIENT);
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
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
