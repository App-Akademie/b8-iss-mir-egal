import 'package:flutter/material.dart';
import 'package:iss_mir_egal/auth/view/login_page.dart';
import 'package:iss_mir_egal/gen/assets.gen.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
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
                'Account erstellen',
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
                onPressed: () {},
                child: Text('Account erstellen'),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Hast du bereits einen Account?',
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  );
                },
                child: Text('Zum Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
