import 'package:api/bd/favoriteManager.dart';
import 'package:api/model/favorite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/Tienda.dart';
import '../model/User.dart';
import '../util/ButtonLogin.dart';
import '../util/constants.dart';

class DetailTiendas extends StatefulWidget {
  final Tienda tienda;
  final User user;
  final List<Tienda> listFavorites;

  const DetailTiendas(
      {Key? key,
      required this.tienda,
      required this.user,
      required this.listFavorites})
      : super(key: key);

  @override
  State<DetailTiendas> createState() => _DetailTiendasState();
}

class _DetailTiendasState extends State<DetailTiendas> {
  FavoriteManager favoriteManager = FavoriteManager();
  late Favorite favorite;
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    favorite = Favorite([], widget.user.user);

    if (widget.listFavorites.isNotEmpty) {
      for (var animal in widget.listFavorites) {
        if (animal.name == widget.tienda.name) {
          isFavorite = true;
          break;
        }
      }
    } else {
      isFavorite = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimary2Color,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Información",
          style: GoogleFonts.poppins(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () async {
                setState(() {
                  isFavorite = !isFavorite;
                });

                if (isFavorite) {
                  await favorite.saveFavoriteTiendas(
                      widget.tienda, widget.user.user);
                } else {
                  await favorite.removeFavoriteTienda(
                      widget.tienda, widget.user.user);
                }
              },
              icon: !isFavorite
                  ? const Icon(
                      Icons.shopping_cart,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.shopping_cart,
                      color: Colors.green,
                    ))
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          widget.tienda.image,
                          fit: BoxFit.fill,
                        )),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      widget.tienda.name,
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Text("Ubicacion: ${widget.tienda.location}"),
                          Spacer(),
                          Text("Edad: ${widget.tienda.age}")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.tienda.description,
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                )),
            ButtonLogin(
                press: () async {
                  setState(() {
                    isFavorite = !isFavorite;
                  });

                  if (isFavorite) {
                    await favorite.saveFavoriteTiendas(
                        widget.tienda, widget.user.user);
                  } else {
                    await favorite.removeFavoriteTienda(
                        widget.tienda, widget.user.user);
                  }
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        icon: const Icon(Icons.check,
                            size: 30, color: Colors.green),
                        title: const Text(
                            "Producto añadido con éxito al carrito de compras"),
                        content: SingleChildScrollView(),
                        actionsAlignment: MainAxisAlignment.center,
                      );
                    },
                  );
                },
                title: "Añadir a Carrito"),
          ],
        ),
      ),
    );
  }
}
