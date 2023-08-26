import 'package:api/Providers/Products_Provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../util/ButtonLogin.dart';
import '../util/constants.dart';

class DetailTiendas extends StatefulWidget {
  final ModelosProducts products;

  const DetailTiendas({
    Key? key,
    required this.products,
  }) : super(key: key);

  @override
  State<DetailTiendas> createState() => _DetailTiendasState();
}

class _DetailTiendasState extends State<DetailTiendas> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
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
                        child: Image.network(
                          widget.products.url,
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
                      widget.products.title,
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        widget.products.description,
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
