import 'package:flutter/material.dart';
import 'package:share_official/screens/my_home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final pref = await SharedPreferences.getInstance();
            await pref.setBool('isLoggedIn', true);
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => MyHomePage(),
              ),
            );
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
