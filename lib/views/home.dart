import 'package:app_bank/models/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    final titles = ["Cliente", "Administrador"];

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        padding: padding,
        child: Stack(
          children: [
            Container(
              height: alturaTela,
              width: size.width,
              decoration: const BoxDecoration(
                color: Color(0xffA91CE0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeText(
                    'NewBank',
                    maxLines: 1,
                    minFontSize: 50,
                    maxFontSize: 60,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const AutoSizeText(
                    'Seja bem-vindo(a).\nEscolha uma das opções abaixo.',
                    maxLines: 2,
                    minFontSize: 20,
                    maxFontSize: 30,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: size.height * .05),
                    child: SizedBox(
                      height: size.height * .20,
                      width: size.width * .70,
                      child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: espacamento,
                            child: SizedBox(
                              height: size.height * .07,
                              child: ElevatedButton(
                                onPressed: () {
                                  (index == 0)
                                      ? Navigator.pushNamed(
                                          context, Routes.HOME_CLIENT)
                                      : Navigator.pushNamed(
                                          context, Routes.HOME_ADMIN);
                                },
                                child: AutoSizeText(
                                  titles[index],
                                  maxLines: 1,
                                  minFontSize: 15,
                                  maxFontSize: 20,
                                  style: Theme.of(context).textTheme.bodyMedium,
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
}
