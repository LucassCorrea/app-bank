// ignore_for_file: file_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  final String cardNumber;
  final void Function()? onpressed;
  final Gradient backgroundGradient;
  final String cardIcon;
  final String name;
  final String expires;
  final String cvc;

  const CreditCard({
    Key? key,
    required this.onpressed,
    required this.cardNumber,
    required this.expires,
    required this.name,
    required this.cvc,
    this.cardIcon = "assets/icons/mastercard-logo.png",
    this.backgroundGradient = const LinearGradient(colors: [
      Color(0xffB938E0),
      Color(0xffB938E0),
    ]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: backgroundGradient,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 15,
            left: 10,
            right: 10,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      cardIcon,
                      width: 40,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AutoSizeText(
                      cardNumber,
                      maxLines: 1,
                      minFontSize: 10,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AutoSizeText(
                          "Nome",
                          maxLines: 1,
                          minFontSize: 10,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        AutoSizeText(
                          name,
                          maxLines: 1,
                          minFontSize: 10,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AutoSizeText(
                          "Expira",
                          maxLines: 1,
                          minFontSize: 10,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        AutoSizeText(
                          expires,
                          maxLines: 1,
                          minFontSize: 10,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
