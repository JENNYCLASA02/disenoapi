import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    required this.login,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(login ? "¿No tienes una cuenta ? " : "¿Ya tienes una cuenta ? ",
            style: GoogleFonts.kanit(color: kPrimaryColor)),
        GestureDetector(
          onTap: press,
          child: Text(login ? "Registrarse" : "Inicia sesion",
              style: GoogleFonts.kanit(
                  color: kPrimaryColor, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
