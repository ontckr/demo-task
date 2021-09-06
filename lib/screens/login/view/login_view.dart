import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_task/screens/home/view/home_view.dart';
import 'package:internative_task/screens/login/viewmodel/login_view_model.dart';

class LoginView extends StatefulWidget {
  LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _loginViewModel = LoginViewModel();
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailFilter = new TextEditingController();
  final TextEditingController _passwordFilter = new TextEditingController();
  String _email = "";
  String _password = "";
  bool passwordVisible = true;
  bool emailExists = false;

  @override
  void dispose() {
    _emailFilter.dispose();
    _passwordFilter.dispose();
    super.dispose();
  }

  _loginPageState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue[100],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Container(
              height: 280,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildTextFields(),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tightFor(width: 90, height: 50),
                      child: loginButton(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  ElevatedButton loginButton() {
    return ElevatedButton(
      child: Text('Giriş'),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue[400],
        onPrimary: Colors.white,
        shape: StadiumBorder(),
        textStyle: TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
      ),
      onPressed: () async {
        var result = await _loginViewModel.login(_emailFilter.text, _passwordFilter.text);
        if (result) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
        } else {
          final snackBar = SnackBar(content: Text('Lütfen giriş bilgilerinizi kontrol ediniz'));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );
  }

  Widget _buildTextFields() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: _emailFilter,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.mail_outline),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
              validator: (value) => _loginViewModel.emailValidation(value!),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: Observer(
              builder: (_) => TextFormField(
                controller: _passwordFilter,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _loginViewModel.passwordToggle();
                    },
                    icon: Icon(_loginViewModel.passwordVisible ? Icons.visibility : Icons.visibility_off),
                  ),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                ),
                obscureText: _loginViewModel.passwordVisible,
              ),
            ),
          )
        ],
      ),
    );
  }
}
