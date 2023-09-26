import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_fonts/persian_fonts.dart';
import 'home.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({
    Key? key,
  }) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePassword = FocusNode();
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  final TextStyle _samimStyle = PersianFonts.Samim;
  final TextStyle _shabnamStyle = PersianFonts.Shabnam;
  final TextStyle _vazirStyle = PersianFonts.Vazir;
  final TextStyle _yekanStyle = PersianFonts.Yekan;
  final TextStyle _sahelStyle = PersianFonts.Sahel;
  final TextStyle _VazirDicorationStyle = const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 14,
    color: Colors.orange,
  );

  bool _obscurePassword = true;
  final Box _boxLogin = Hive.box("login");
  final Box _boxAccounts = Hive.box("accounts");

  @override
  Widget build(BuildContext context) {
    if (_boxLogin.get("loginStatus") ?? false) {
      return Home();
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 120),
              const Text(
                "خوش آمدید",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.orange,
                  fontFamily: 'Lalezar',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "ورود به برنامه",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                  fontFamily: 'Lalezar',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 60),
              TextFormField(
                controller: _controllerPhoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "شماره تلفن",
                  labelStyle: _VazirDicorationStyle,
                  prefixIconColor: Colors.orange,
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.orange)),
                ),
                onEditingComplete: () => _focusNodePassword.requestFocus(),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "لطفا  شماره تلفن را وارد نمایید";
                  } else if (!_boxAccounts.containsKey(value)) {
                    return "شماره تلفنی وارد کرده اید قبلا ثبت نام شده است";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                focusNode: _focusNodePassword,
                obscureText: _obscurePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "رمز عبور",
                  labelStyle: _VazirDicorationStyle,
                  prefixIconColor: Colors.orange,
                  suffixIconColor: Colors.orange,
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: _obscurePassword
                        ? const Icon(Icons.visibility_outlined)
                        : const Icon(Icons.visibility_off_outlined),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.orange)),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "لطفا رمز عبور را وارد نمایید";
                  } else if (value !=
                      _boxAccounts.get(_controllerPhoneNumber.text)) {
                    return "رمز عبور اشتباه است";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 60),
              Column(
                children: [
                  SizedBox(
                    width: 320,
                    height: 55,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.orange,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _boxLogin.put("loginStatus", true);
                          _boxLogin.put(
                              "userName", _controllerPhoneNumber.text);

                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Home();
                              },
                            ),
                          );
                        }
                      },
                      child: const Text(
                        "ورود به برنامه",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Vazir',
                          color: Color.fromARGB(255, 54, 59, 61),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          _formKey.currentState?.reset();

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Signup();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "ثبت نام",
                          style: TextStyle(
                            fontFamily: 'Lalezar',
                            fontSize: 17,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      const Text(
                        "آیا ثبت نام نکرده اید؟",
                        style: TextStyle(
                          fontFamily: 'Lalezar',
                          fontSize: 18,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNodePassword.dispose();
    _controllerPhoneNumber.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }
}
