import 'package:api/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/Tienda.dart';
import '../model/User.dart';
import '../model/favorite.dart';

class FavoriteView extends StatefulWidget {
  final List<Tienda> listFavorites;
  final User user;
  const FavoriteView(
      {Key? key, required this.listFavorites, required this.user})
      : super(key: key);

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
        title: Text("Carrito de Compras",
            style: GoogleFonts.poppins(color: Colors.black)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: widget.listFavorites.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.2, mainAxisSpacing: 10),
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () async {
                  final favorite = Favorite([], widget.user.user);
                  final favoriteAnimals =
                      await favorite.loadFavoriteTiendas(widget.user.user);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8))
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          child: Image.asset(
                            widget.listFavorites[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            widget.listFavorites[index].name,
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
