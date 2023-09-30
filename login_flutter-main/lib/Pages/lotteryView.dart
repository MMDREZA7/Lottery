import 'package:flutter/material.dart';
import 'package:login_flutter/ui/home.dart';

class LotteryView extends StatefulWidget {
  const LotteryView({super.key});

  @override
  State<LotteryView> createState() => _LotteryViewState();
}

class _LotteryViewState extends State<LotteryView> {
  //

  final TextStyle _appBarTextStyle = const TextStyle(
      fontSize: 30,
      color: Colors.deepOrange,
      fontWeight: FontWeight.w500,
      fontFamily: 'Lalezar');

  final TextStyle _textStyle = TextStyle(
    fontSize: 24,
    fontFamily: 'Vazir',
    color: Colors.deepOrange,
    fontWeight: FontWeight.w800,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(
          'صفحه قرعه کشی',
          style: _appBarTextStyle,
        ),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                print('Set Stated');
              });
            },
            child: Text(
              'Lottery Page',
              style: _textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
