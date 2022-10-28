import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:app_bank/views/components/button_appBar.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
      "E-mail",
      "CPF",
    ];

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
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * .80,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        "Recuperar senha",
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
                      width: size.width * .85,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: espacamento,
                            child: index != 2
                                ? SizedBox(
                                    height: size.height * .08,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        label: AutoSizeText(
                                          titles[index],
                                        ),
                                      ),
                                    ),
                                  )
                                : SizedBox(
                                    height: size.height * .08,
                                    child: TextFormField(
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
                                        CpfInputFormatter(),
                                      ],
                                      decoration: InputDecoration(
                                        label: AutoSizeText(
                                          titles[index],
                                        ),
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
            )
          ],
        ),
      ),
    );
  }
}
