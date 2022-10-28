import 'package:app_bank/models/utils/routes.dart';
import 'package:app_bank/views/admin/approval_credit-card.dart';
import 'package:app_bank/views/admin/home_admin.dart';
import 'package:app_bank/views/admin/menu_admin.dart';
import 'package:app_bank/views/admin/register_admin.dart';
import 'package:app_bank/views/admin/registration_credit-card.dart';
import 'package:app_bank/views/client/add_credit-card.dart';
import 'package:app_bank/views/client/edit_profile.dart';
import 'package:app_bank/views/client/menu_client.dart';
import 'package:app_bank/views/client/register_client.dart';
import 'package:app_bank/views/client/request_credit-card.dart';
import 'package:app_bank/views/forgot_password.dart';
import 'package:app_bank/views/home.dart';
import 'package:app_bank/views/client/home_client.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final tema = ThemeData();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // definindo a orientação da aplicação
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // definindo como o app deve se comportar diante difentes dispositivos
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.black,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    // color background: Color(0xffB938E0)
    // color : Color(0xff501861)
    // color : Color(0xffCD7EE6)
    // color : Color(0xff573561)
    // color : Color(0xff8E2CAD)

    return MaterialApp(
      // nome do banco: "NewBank"
      title: 'NewBank',
      // definindo o tema dos widgets do aplicativo
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        textTheme: const TextTheme(
          // font logo
          titleLarge: TextStyle(
            fontFamily: 'Moderna',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          // font botão
          bodyMedium: TextStyle(
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
          // font titulos
          headlineMedium: TextStyle(
            fontFamily: 'Roboto',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: const BorderSide(
              color: Colors.transparent,
            ),
            backgroundColor: Colors.white,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.grey[300],
          suffixIconColor: const Color(0xffB938E0),
          labelStyle: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black54,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          floatingLabelStyle: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      home: AnimatedSplashScreen(
        backgroundColor: const Color(0xffB938E0),
        duration: 1000,
        pageTransitionType: PageTransitionType.fade,
        splash: const AutoSizeText(
          'NewBank',
          maxLines: 1,
          minFontSize: 50,
          style: TextStyle(
            fontSize: 60,
            fontFamily: 'Moderna',
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        nextScreen: const HomePage(),
      ),
      routes: {
        // Routes.HOME: (context) => const HomePage(),
        Routes.HOME_CLIENT: (context) => const HomeClient(),
        Routes.HOME_ADMIN: (context) => const HomeAdmin(),
        Routes.REGISTER_CLIENT: (context) => const RegisterClient(),
        Routes.REGISTER_ADMIN: (context) => const RegisterAdmin(),
        Routes.MENU_CLIENT: (context) => const MenuClient(),
        Routes.MENU_ADMIN: (context) => const MenuAdmin(),
        Routes.ADD_CREDIT_CARD: (context) => const AddCreditCard(),
        Routes.REQUEST_CREDIT_CARD: (context) => const RequestCreditCard(),
        Routes.EDIT_PROFILE: (context) => const EditProfile(),
        Routes.FORGOT_PASSWORD: (context) => const ForgotPassword(),
        Routes.APPROVAL_CREDIT_CARD: (context) => const ApprovalCreditCard(),
        Routes.REGISTRATION_CREDIT_CARD: (context) =>
            const RegistrationCreditCard(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
