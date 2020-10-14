import 'package:flutter/material.dart';

class SlidingLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Size loginFormSize = Size(360, 400);

    double _initialHorizontalPosition = -size.width / 2;
    double _centeredHorizontalPosition =
        size.width / 2 - loginFormSize.width / 2;
    double _centeredVerticalPosition =
        size.height / 2 - loginFormSize.height / 2;

    return Scaffold(
      body: TweenAnimationBuilder(
        tween: Tween<double>(
          begin: _initialHorizontalPosition,
          end: _centeredHorizontalPosition,
        ),
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
        builder: (context, value, child) {
          return Stack(
            children: [
              Positioned(
                left: value,
                top: _centeredVerticalPosition,
                width: loginFormSize.width,
                height: loginFormSize.height,
                child: LoginForm(),
              ),
            ],
          );
        },
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _loginTitleText,
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Username'),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          obscureText: true,
        ),
        RaisedButton(
          onPressed: () {},
          color: Colors.green[200],
          child: Text('Login'),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Don't have an account?",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign Up',
            style: TextStyle(color: Colors.blue[300]),
          ),
        )
      ],
    );
  }

  final Text _loginTitleText = Text(
    'Login',
    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  );
}
