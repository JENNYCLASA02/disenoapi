import 'package:api/util/ShowDialog.dart';
import 'package:api/view/CarritoView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/User.dart';
import '../model/favorite.dart';

class Profile extends StatefulWidget {
  final User user;

  const Profile({Key? key, required this.user}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: ListView(
      padding: const EdgeInsets.all(12),
      physics: const BouncingScrollPhysics(),
      children: [
        ListTile(
          leading: const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("../assets/profile2.jpg"),
          ),
          title: Text(widget.user.user,
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          subtitle: Text(widget.user.email),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(
            thickness: 2,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            optionMenu(Icons.person_outline_rounded, Colors.deepPurple,
                "Informacion personal"),
            SizedBox(
              height: 10.h,
            ),
            optionMenu(Icons.settings_suggest, Colors.blue, "Configuracion"),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              child: optionMenu(
                  Icons.shopping_cart, Colors.deepPurple, "Mi Carrito"),
              onTap: () async {
                final favorite = Favorite([], widget.user.user);
                final favoriteAnimals =
                    await favorite.loadFavoriteTiendas(widget.user.user);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FavoriteView(
                        user: widget.user,
                        listFavorites: favoriteAnimals,
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              child: optionMenu(Icons.exit_to_app, Colors.red, "Salir"),
              onTap: () {
                showAlertDialogExit(context, Icons.exit_to_app, "Salir",
                    "¿Seguro que quieres salir?", Colors.red, () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                });
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                thickness: 2,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            optionMenu(Icons.info_outline, Colors.black, "Ayuda y comentarios"),
            SizedBox(
              height: 10.h,
            ),
            optionMenu(Icons.border_color_outlined, Colors.black, "Manual"),
            SizedBox(
              height: 10.h,
            ),
            optionMenu(Icons.textsms_rounded, Colors.black, "Comunidad"),
          ],
        )
      ],
    ));
  }

  Widget optionMenu(IconData icon, Color color, String text) {
    return ListTile(
      leading: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: color.withOpacity(0.09),
            borderRadius: BorderRadius.circular(18)),
        child: Icon(
          icon,
          color: color,
        ),
      ),
      title: Text(
        text,
        style: GoogleFonts.poppins(),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        color: Colors.black,
        size: 18,
      ),
    );
  }
}
