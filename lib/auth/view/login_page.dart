import 'package:flutter/material.dart';
import 'package:iss_mir_egal/auth/view/signup_page.dart';
import 'package:iss_mir_egal/gen/assets.gen.dart';
import 'package:iss_mir_egal/home/data/meals_controller.dart';
import 'package:iss_mir_egal/home/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({required this.mealsController, super.key});
  final MealsController mealsController;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool _showErrorMessage = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    print('das hier wird aufgerufen, wenn dieses widget aufgeräumt wird');
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: passwordController,
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
              if (_showErrorMessage)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Anmeldedaten sind nicht korrekt',
                    style: TextTheme.of(context)
                        .bodyMedium
                        ?.copyWith(color: Colors.red),
                  ),
                ),
              FilledButton(
                onPressed: () {
                  // hole den wert von email und passwort
                  final email = emailController.text;
                  final password = passwordController.text;

                  print('Email ist: $email und passwort ist $password');
                  if (email != password) {
                    // hier lief was schief mit der authentifizierung

                    emailController.clear();
                    passwordController.clear();
                    setState(() {
                      _showErrorMessage = true;
                    });
                    return;
                  }

                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        mealsController: widget.mealsController,
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
                      builder: (context) => SignupPage(
                        mealsController: widget.mealsController,
                      ),
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
