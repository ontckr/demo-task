import 'package:flutter/material.dart';
import 'package:internative_task/screens/home/view/home_view.dart';
import 'package:internative_task/screens/login/view/login_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  checkUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.get('token');

    token != null
        ? Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
              return HomeView();
            }),
          )
        : Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) {
              return LoginView();
            }),
          );
  }

  @override
  void initState() {
    super.initState();
    checkUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
