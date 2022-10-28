import 'package:app_bank/views/components/button_appBar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterAdmin extends StatefulWidget {
  const RegisterAdmin({super.key});

  @override
  State<RegisterAdmin> createState() => _RegisterAdminState();
}

class _RegisterAdminState extends State<RegisterAdmin> {
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
      "CPF",
      "E-mail",
      "Endereço",
      "Estado",
      "Senha",
      "Confirmar senha",
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: ButtonAppBar(
          onpressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const AutoSizeText(
          'NewBank',
          maxLines: 1,
          minFontSize: 12,
          maxFontSize: 25,
          style: TextStyle(
            fontFamily: 'Moderna',
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Color(0xffB938E0),
          ),
        ),
        toolbarHeight: size.height * .10,
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: size.height * .70,
                    width: size.width * .85,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: espacamento,
                          child: index != 4
                              ? SizedBox(
                                  height: size.height * .08,
                                  child: TextFormField(
                                    inputFormatters: index == 1
                                        ? [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            CpfInputFormatter(),
                                          ]
                                        : [],
                                    decoration: InputDecoration(
                                      labelText: titles[index],
                                    ),
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
                                ),
                        );
                      },
                      padding: const EdgeInsets.all(0),
                      itemCount: titles.length,
                    ),
                  ),
                  SizedBox(
                    height: size.height * .15,
                    child: Center(
                      child: SizedBox(
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
                            minFontSize: 15,
                            maxFontSize: 20,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
