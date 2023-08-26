import 'package:api/Models/models.dart';
import 'package:api/model/BottomIcon.dart';
import 'package:api/model/User.dart';
import 'package:api/util/CategoryItem.dart';
import 'package:api/util/Linepainter.dart';
import 'package:api/util/ShowDialog.dart';
import 'package:api/util/constants.dart';
import 'package:api/view/Profile.dart';
import 'package:api/view/detailTienda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Providers/Products_Provider.dart';
import '../view/sucessStories.dart';

class Home extends StatefulWidget {
  final User user;
  const Home({Key? key, required this.user}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

/*Future<List<ModelosProducts>> obtenerDatos() async {
  try {
    List<ModelosProducts> listaDeProductos = await ProductProvider().getProducts();
    return listaDeProductos;
  } catch (e) {
    print('Error al obtener datos: $e');
    throw e;
  }
}*/

class _HomeState extends State<Home> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Widget body() {
      switch (currentPage) {
        case 0:
          return HomePage(user: widget.user);

        case 1:
          return const SuccessStories();

        case 2:
          return Profile(
            user: widget.user,
          );

        default:
          return Center(
            child: Text(
              'Hubo un error',
              style: GoogleFonts.roboto(),
            ),
          );
      }
    }

    return WillPopScope(
      onWillPop: () async {
        showAlertDialogExit(context, Icons.exit_to_app, "Salir",
            "¿Seguro que quieres salir?", Colors.red, () {
          Navigator.popUntil(context, (route) => route.isFirst);
        });

        return false;
      },
      child: Scaffold(
        backgroundColor: bgColor,
        body: body(),
        bottomNavigationBar: Container(
          height: 60.h,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ...List.generate(
                  bottomIcons.length,
                  (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentPage = index;
                          });
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              currentPage == index
                                  ? bottomIcons[index].select
                                  : bottomIcons[index].unselect,
                              color: currentPage == index
                                  ? kPrimary2Color
                                  : Colors.black,
                            ),
                            const SizedBox(height: 10),
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              decoration: BoxDecoration(
                                  color: currentPage == index
                                      ? kPrimary2Color
                                      : Colors.black,
                                  shape: BoxShape.circle),
                              width: currentPage == index ? 7 : 0,
                              height: currentPage == index ? 7 : 0,
                            )
                          ],
                        ),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCategory = 10;
  bool favorite = false;
  List<ModelosProducts> listaProducto = [];
  List<String> listaCategory = [];

  static const List<String> listCity = <String>[
    'Todos',
    'Barranquilla',
    'Bogota',
    'Medellin',
    'Cali',
    'Valledupar',
    'Bucaramanga'
  ];
  String listSelect = listCity.first;

  @override
  void initState() {
    super.initState();
    cargarDatos();
    cargarCategorias();
  }

  Future<void> cargarDatos() async {
    try {
      List<ModelosProducts> datos = await ProductProvider().getProducts();
      setState(() {
        listaProducto = datos; // Asigna la lista a la variable
      });
    } catch (e) {
      // Manejo de errores
      print('Error al cargar datos: $e');
    }
  }

  Future<void> cargarCategorias() async {
    try {
      List<String> dato = await ProductProvider().getCategory();
      setState(() {
        listaCategory = dato;
      });
    } catch (e) {
      print('Error al cargar datos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Image.network(
            'assets/logo.png',
            height: 120,
            width: 120,
          ),
          title: Text('Moda & Estilo',
              style: GoogleFonts.roboto(
                  fontSize: 20.sp,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold)),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text('Tu ubicación',
                                  style: GoogleFonts.roboto(
                                      fontSize: 15.sp,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    color: kPrimary2Color,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 5),
                                  DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: listSelect,
                                      icon: const Icon(
                                          Icons.keyboard_arrow_down_rounded),
                                      style:
                                          const TextStyle(color: Colors.black),
                                      onChanged: (String? value) {
                                        setState(() {
                                          if (value == listCity[0]) {
                                            listSelect = value!;
                                          } else {
                                            listSelect = value!;
                                          }
                                        });
                                      },
                                      items: listCity
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.black),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Icon(Icons.shopping_cart,
                              color: kPrimary2Color)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.h),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 4,
                              offset: Offset(4, 8))
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Buscar Productos',
                          hintStyle: GoogleFonts.poppins(),
                          prefixIcon: const Icon(Icons.search),
                          prefixIconColor: kPrimary2Color),
                      onChanged: (value) {},
                    ),
                  )),
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Categorías",
                      style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Text(
                      "Ver todos",
                      style: GoogleFonts.roboto(color: kPrimary2Color),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: SizedBox(
                  height: 90.h,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listaCategory.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: 0.6,
                            mainAxisSpacing: 5),
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                        child: GestureDetector(
                          onTap: () {},
                          child: CategoryItem(
                              selected: currentCategory == index,
                              category: listaCategory[index]),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.h),
                    child: Text('Result (${listaProducto.length})',
                        style: GoogleFonts.roboto(
                            color: Colors.black.withOpacity(0.6))),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: CustomPaint(
                        painter: LinePainter(),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.h),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listaProducto.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.2,
                            mainAxisSpacing: 10),
                    itemBuilder: (BuildContext context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return DetailTiendas(
                                    products: listaProducto[index],
                                  );
                                },
                              ),
                            );
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
                                    child: Image.network(
                                      listaProducto[index].url,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Center(
                                    child: Text(
                                      listaProducto[index].title,
                                      style:
                                          GoogleFonts.poppins(fontSize: 10.sp),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
