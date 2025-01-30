import 'package:flutter/material.dart';
import 'package:iss_mir_egal/auth/view/signup_page.dart';
import 'package:iss_mir_egal/gen/assets.gen.dart';
import 'package:iss_mir_egal/home/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Hero(
                tag: 'app_icon',
                child: Assets.images.logo.image(
                  height: 200,
                ),
              ),
              Text(
                'Einloggen',
                style: TextTheme.of(context).headlineLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                obscureText: _isObscure,
                decoration: InputDecoration(
                  labelText: 'Passwort',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              FilledButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        meals: [],
                      ),
                    ),
                  );
                },
                child: Text('Einloggen'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Noch keinen Account?',
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => SignupPage(),
                    ),
                  );
                },
                child: Text('Account erstellen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
