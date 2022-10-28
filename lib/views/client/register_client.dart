import 'package:app_bank/views/components/button_appBar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisterClient extends StatefulWidget {
  const RegisterClient({super.key});

  @override
  State<RegisterClient> createState() => _RegisterClientState();
}

class _RegisterClientState extends State<RegisterClient> {
  @override
  void initState() {
    super.initState();
  }

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
      "Telefone",
      "Endereço",
      "Estado",
      "Tipo de conta",
      "Senha",
      "Confirmar senha",
    ];
    final itens = ["Conta Corrente", "Conta Poupança"];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: ButtonAppBar(
          onpressed: () => Navigator.pop(context),
        ),
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
        centerTitle: true,
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
                          child: index != 5 && index != 6
                              ? SizedBox(
                                  height: size.height * .08,
                                  child: TextFormField(
                                    inputFormatters: index == 2
                                        ? [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            CpfInputFormatter(),
                                          ]
                                        : index == 3
                                            ? [
                                                FilteringTextInputFormatter
                                                    .digitsOnly,
                                                TelefoneInputFormatter(),
                                              ]
                                            : [],
                                    decoration: InputDecoration(
                                      labelText: titles[index],
                                    ),
                                  ),
                                )
                              : index == 5
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
                                              (String estado) =>
                                                  DropdownMenuItem(
                                                value: estado,
                                                child: AutoSizeText(estado),
                                              ),
                                            )
                                            .toList(),
                                        onChanged: (estadoSelecionado) =>
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
                          onPressed: () {},
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
