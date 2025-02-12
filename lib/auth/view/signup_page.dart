import 'package:flutter/material.dart';
import 'package:iss_mir_egal/auth/view/login_page.dart';
import 'package:iss_mir_egal/gen/assets.gen.dart';
import 'package:iss_mir_egal/home/data/meals_controller.dart';
import 'package:iss_mir_egal/home/view/home_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({required this.mealsController, super.key});
  final MealsController mealsController;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        final expression = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (expression.hasMatch(value ?? '')) {
                          // value entspricht unserem regex pattern -> email ist valide!
                          return null;
                        } else {
                          // value entspricht nicht unserem regex pattern -> keine valide email!
                          return 'Keine valide Email';
                        }
                      },
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      obscureText: _isObscure,
                      validator: (value) {
                        return (value?.length ?? 0) > 7
                            ? null
                            : 'Passwort muss mindestens 8 Zeichen lang sein';
                      },
                      decoration: InputDecoration(
                        labelText: 'Passwort',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _isObscure = !_isObscure;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 24,
              ),
              FilledButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // form ist valide
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          mealsController: widget.mealsController,
                        ),
                      ),
                    );
                  } else {
                    // form ist nicht valide
                  }
                },
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
                      builder: (context) => LoginPage(
                        mealsController: widget.mealsController,
                      ),
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
