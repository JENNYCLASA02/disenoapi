import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class ButtonLogin extends StatelessWidget {
  final VoidCallback press;
  final String title;

  const ButtonLogin({Key? key, required this.press, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    /*color: kPrimary2Color,*/
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          kPrimaryColor,
                          kPrimary2Color,
                        ]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                  textStyle: const TextStyle(fontSize: 15),
                ),
                onPressed: press,
                child: Center(
                  child: Text(title,
                      style: GoogleFonts.kanit(
                          color: Colors.white, fontSize: 17.sp)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
