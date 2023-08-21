import 'package:api/bd/UserManager.dart';
import 'package:api/model/User.dart';
import 'package:api/model/favorite.dart';
import 'package:api/util/AlreadyHaveAnAccountCheck.dart';
import 'package:api/util/ButtonLogin.dart';
import 'package:api/util/ShowDialog.dart';
import 'package:api/util/constants.dart';
import 'package:api/view/Register.dart';
import 'package:api/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = false;

  @override
  void initState() {
    _obscureText = true;
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();

  UserManager userManager = UserManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
        ),
        SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 100.h,
                  ),
                  Image(
                    image: const AssetImage('../assets/logo.png'),
                    height: 200.h,
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      controller: userController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: Colors.purple),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 1, color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: const Icon(
                          Icons.person,
                          color: kPrimaryColor,
                        ),
                        labelText: "Usuario",
                        labelStyle: TextStyle(
                            fontSize: 15.sp,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.w300),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Porfavor digitar todos los datos';
                        }
                        return null;
                      },
                      onSaved: (value) => userController =
                          value?.replaceAll(' ', '') as TextEditingController,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: TextFormField(
                      controller: passController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: Colors.purple),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: kPrimaryColor),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: kPrimaryColor,
                          ),
                          suffixIcon: _obscureText == true
                              ? IconButton(
                                  icon: const Icon(Icons.visibility),
                                  color: kPrimaryColor,
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                )
                              : IconButton(
                                  icon: const Icon(Icons.visibility_off),
                                  color: kPrimaryColor,
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                          labelText: "Contraseña",
                          labelStyle: TextStyle(
                              fontSize: 15.sp,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w300)),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Porfavor digitar todos los datos';
                        }
                        return null;
                      },
                      onSaved: (value) => passController =
                          value?.replaceAll(' ', '') as TextEditingController,
                    ),
                  ),
                  ButtonLogin(
                      press: () async {
                        if (_formKey.currentState!.validate()) {
                          User? userLoad = await userManager.loadUserList(
                              userController.text, passController.text);
                          if (userLoad != null) {
                            final favorite = Favorite([], userLoad.user);
                            final favoriteAnimals = await favorite
                                .loadFavoriteTiendas(userLoad.user);
                            userController.clear();
                            passController.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return Home(
                                      user: userLoad,
                                      listFavorites: favoriteAnimals);
                                },
                              ),
                            );
                          } else {
                            showAlertDialog(context, Icons.close, "Error",
                                "Credenciales Incorrectas", Colors.red, () {
                              userController.clear();
                              passController.clear();
                              Navigator.pop(context);
                            });
                          }
                        }
                      },
                      title: "Ingresar"),
                  AlreadyHaveAnAccountCheck(
                    press: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Register();
                          },
                        ),
                      );
                    },
                    login: true,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
