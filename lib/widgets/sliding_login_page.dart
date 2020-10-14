import 'package:flutter/material.dart';

class SlidingLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final Size loginFormSize = Size(400, 400);

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
        duration: Duration(milliseconds: _animationDurationInMilliseconds),
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

  final int _animationDurationInMilliseconds = 300;
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
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            border: OutlineInputBorder(),
            labelText: 'Username',
          ),
        ),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            border: OutlineInputBorder(),
            labelText: 'Password',
          ),
          obscureText: true,
        ),
        GestureDetector(
          onTap: () {
            print('logging in');
          },
          child: Container(
            //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.center,
            width: 400,
            height: 40,
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Colors.green[200],
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: Text('Log in'),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
        ),
      ],
    );
  }

  final Text _loginTitleText = Text(
    'Login',
    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
  );
}
