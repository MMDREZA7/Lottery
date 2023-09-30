import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:login_flutter/Pages/lotteryView.dart';

import 'login.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final Box _boxLogin = Hive.box("login");

  final Color _Orange = Colors.orange;

  final TextStyle _appBarTextstyle = const TextStyle(
      fontSize: 25,
      color: Colors.orange,
      fontFamily: 'Lalezar',
      fontWeight: FontWeight.w400);

  final TextStyle _textStyleButton = const TextStyle(
    fontSize: 23,
    color: Color.fromARGB(255, 66, 77, 82),
    fontWeight: FontWeight.bold,
    fontFamily: 'Lalezar',
  );

  final ButtonStyle _buttonStyle = const ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(
      Colors.orange,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          " صفحه اصلی",
          style: _appBarTextstyle,
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(0.5),
            child: DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange),
              ),
              child: IconButton(
                onPressed: () {
                  _boxLogin.clear();
                  _boxLogin.put("loginStatus", false);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const Login();
                      },
                    ),
                  );
                },
                icon: Icon(
                  Icons.logout_rounded,
                  color: _Orange,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blueGrey[800],
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(100, 10, 100, 20),
            child: Column(
              children: [
                const Text(
                  "🎉 خوش آمدید 🎉",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Vazir',
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  _boxLogin.get("userName"),
                  style: _appBarTextstyle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          // TextButtons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style: _buttonStyle,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LotteryView(),
                      ),
                    );
                  },
                  child: Text(
                    'صفحه قرعه کشی',
                    style: _textStyleButton,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style: _buttonStyle,
                  onPressed: () {},
                  child: Text(
                    'TextButton',
                    style: _textStyleButton,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style: _buttonStyle,
                  onPressed: () {},
                  child: Text(
                    'TextButton',
                    style: _textStyleButton,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style: _buttonStyle,
                  onPressed: () {},
                  child: Text(
                    'TextButton',
                    style: _textStyleButton,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style: _buttonStyle,
                  onPressed: () {},
                  child: Text(
                    'TextButton',
                    style: _textStyleButton,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextButton(
                  style: _buttonStyle,
                  onPressed: () {},
                  child: Text(
                    'TextButton',
                    style: _textStyleButton,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
