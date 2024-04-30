import 'package:flutter/material.dart';
import 'package:share_official/screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('Welcome to Home Page'),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                final pref = await SharedPreferences.getInstance();
                await pref.setBool('isLoggedIn', false);
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                );
              },
              child: Text('Go to Splash'),
            ),
          ),
        ],
      ),
    );
  }
}
