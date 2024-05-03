import 'package:flutter/material.dart';
import 'package:share_official/screens/login_page.dart';
import 'package:share_official/screens/my_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoggedIn = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10));
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    final prefs =
        await SharedPreferences.getInstance(); /*truy cập vào bộ nhớ pref */
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false; /*Lấy key từ pref */
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
    if (_isLoggedIn) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage_2()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            children: [
              Text(
                'Splash Screen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
