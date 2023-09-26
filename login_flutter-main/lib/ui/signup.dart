import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:persian_fonts/persian_fonts.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focusNodePhoneNumber = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  final TextEditingController _controllerPhoneNumber = TextEditingController();
  // final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword =
      TextEditingController();

  // final TextStyle _samimStyle = PersianFonts.Samim;
  // final TextStyle _shabnamStyle = PersianFonts.Shabnam;
  // final TextStyle _vazirStyle = PersianFonts.Vazir;
  // final TextStyle _yekanStyle = PersianFonts.Yekan;
  // final TextStyle _sahelStyle = PersianFonts.Sahel;
  final TextStyle _VazirDicorationStyle = const TextStyle(
    fontFamily: 'Vazir',
    fontSize: 14,
    color: Colors.orange,
  );

  final Box _boxAccounts = Hive.box("accounts");
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const SizedBox(height: 170),
              const Text(
                "ثبت نام ",
                style: TextStyle(
                  fontFamily: 'Vazir',
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "اکانت خود را بسازید",
                style: TextStyle(
                  fontFamily: 'Vazir',
                  fontSize: 14,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 35),
              TextFormField(
                focusNode: _focusNodePhoneNumber,
                controller: _controllerPhoneNumber,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "شماره موبایل",
                  labelStyle: _VazirDicorationStyle,
                  prefixIcon: const Icon(Icons.phone),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.orange),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIconColor: Colors.orange,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "شماره موبایل خود را وارد نمایید";
                  } else if (_boxAccounts.containsKey(value)) {
                    return "این شماره موبایل وجود دارد";
                  }

                  return null;
                },
                onEditingComplete: () => _focusNodePassword.requestFocus(),
              ),
              // const SizedBox(height: 10),
              // TextFormField(
              //   controller: _controllerEmail,
              //   focusNode: _focusNodeEmail,
              //   keyboardType: TextInputType.emailAddress,
              //   decoration: InputDecoration(
              //     labelText: "ایمیل ",
              //     prefixIcon: const Icon(Icons.email_outlined),
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //     enabledBorder: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              //   validator: (String? value) {
              //     if (value == null || value.isEmpty) {
              //       return "لطفا ایمیل خود را وارد نمایید";
              //     } else if (!(value.contains('@') && value.contains('.'))) {
              //       return "ایمیل وجود ندارد";
              //     }
              //     return null;
              //   },
              //   onEditingComplete: () => _focusNodePassword.requestFocus(),
              // ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefixIconColor: Colors.orange,
                  suffixIconColor: Colors.orange,
                  labelText: "رمز عبور",
                  labelStyle: _VazirDicorationStyle,
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "لطفا رمز عبور را وارد نمایید";
                  } else if (value.length < 8) {
                    return "رمز عبور باید از 8 کاراکتر بیشتر باشد";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    _focusNodeConfirmPassword.requestFocus(),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _controllerConFirmPassword,
                obscureText: _obscureConfirmPassword,
                focusNode: _focusNodeConfirmPassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "تایید رمز عبور",
                  prefixIconColor: Colors.orange,
                  suffixIconColor: Colors.orange,
                  labelStyle: _VazirDicorationStyle,
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                      icon: _obscureConfirmPassword
                          ? const Icon(Icons.visibility_outlined)
                          : const Icon(Icons.visibility_off_outlined)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.orange),
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "لطفا رمز عبور را وارد نمایید";
                  } else if (value != _controllerPassword.text) {
                    return "رمز عبور تطابق ندارد";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 50),
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
                          _boxAccounts.put(
                            _controllerPhoneNumber.text,
                            _controllerConFirmPassword.text,
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              width: 200,
                              backgroundColor:
                                  Theme.of(context).colorScheme.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              behavior: SnackBarBehavior.floating,
                              content: const Text(
                                "تـبـت نـام بـا مـوفقـیـت به پـایـان رسـیـد",
                                style: PersianFonts.Sahel,
                              ),
                            ),
                          );

                          _formKey.currentState?.reset();

                          Navigator.pop(context);
                        }
                      },
                      child: const Center(
                        child: Text(
                          "ثبت نام",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 45, 48, 49),
                            fontFamily: 'Vazir',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          "ورود",
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: 'Lalezar',
                            fontSize: 18,
                          ),
                        ),
                      ),
                      const Text(
                        "اکانت فعال دارید؟",
                        style: TextStyle(
                          color: Colors.orange,
                          fontFamily: 'Lalezar',
                          fontSize: 18,
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
    // _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _controllerPhoneNumber.dispose();
    // _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }
}
