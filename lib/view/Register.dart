import 'package:api/bd/UserManager.dart';
import 'package:api/model/User.dart';
import 'package:api/util/AlreadyHaveAnAccountCheck.dart';
import 'package:api/util/ButtonLogin.dart';
import 'package:api/util/ShowDialog.dart';
import 'package:api/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _obscureText = false;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  UserManager userManager = UserManager();

  final _formKey = GlobalKey<FormState>();

  var maskFormatter = MaskTextInputFormatter(
      mask: '(###) ###-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

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
                      height: 50.h,
                    ),
                    Image(
                      image: const AssetImage('../assets/logo.png'),
                      height: 200.h,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: kPrimaryColor),
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
                            Icons.alternate_email,
                            color: kPrimaryColor,
                          ),
                          labelText: "E-Mail",
                          labelStyle: TextStyle(
                              fontSize: 15.sp,
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w300),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Porfavor digitar todos los datos';
                          }
                          if (!value.contains('@')) {
                            return 'El formato del correo no esta correcto';
                          }
                          return null;
                        },
                        onSaved: (value) => emailController =
                            value?.replaceAll(' ', '') as TextEditingController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextFormField(
                        inputFormatters: [maskFormatter],
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: kPrimaryColor),
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
                            Icons.phone_outlined,
                            color: kPrimaryColor,
                          ),
                          labelText: "Teléfono",
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
                        onSaved: (value) => phoneController =
                            value?.replaceAll(' ', '') as TextEditingController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: TextFormField(
                        keyboardType: TextInputType.name,
                        controller: userController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1, color: kPrimaryColor),
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
                            Icons.person_outline_rounded,
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
                                  width: 1, color: Colors.orange),
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
                            User? userLoad = await userManager
                                .validUser(userController.text);
                            if (userLoad == null) {
                              User user = User(
                                email: emailController.text,
                                phone: phoneController.text,
                                user: userController.text,
                                pass: passController.text,
                              );
                              await userManager.saveUser(user);
                              showAlertDialog(
                                  context,
                                  Icons.check,
                                  "Felicidades",
                                  "Ya estas registrado puedes iniciar sesión",
                                  Colors.green, () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              });
                            } else {
                              showAlertDialog(
                                  context,
                                  Icons.error_outlined,
                                  "Error",
                                  "El usuario ya esta registrado",
                                  Colors.orangeAccent, () {
                                Navigator.pop(context);
                              });
                            }
                          }
                        },
                        title: "Registrarse"),
                    AlreadyHaveAnAccountCheck(
                        login: false,
                        press: () {
                          Navigator.pop(context);
                        })
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
