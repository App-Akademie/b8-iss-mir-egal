import 'dart:io';

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
  bool _isLoading = false;

  bool _isObscure = true;

  String? _errorMessage;
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // form ist valide
                    final isSignupSuccessful = await signup();
                    if (isSignupSuccessful) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => HomePage(
                            mealsController: widget.mealsController,
                          ),
                        ),
                      );
                    } else {
                      setState(() {
                        _errorMessage = 'Ups hier hat etwas nicht geklappt';
                      });
                    }
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
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(),
                ),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.red,
                      ),
                  textAlign: TextAlign.center,
                )
            ],
          ),
        ),
      ),
    );
  }

  // Ausführung durch Button-Klick
  Future<bool> signup() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // wir simulieren eine wartezeit von X sekunden, in der realität wäre das eine server anfrage
    final res = await _mockServerRequest().catchError((error) {
      // e ist unsere exception die wir bekommen, in dem fall: timeoutexception
      print('exception: $error');
      return false;
    });

    setState(() {
      _isLoading = false;
    });

    return res;
  }

  Future<bool> _mockServerRequest() {
    // später tauschen wir das gegen einen echten server request aus
    return Future.delayed(
      Duration(seconds: 4),
      () => false,
    ).timeout(
      Duration(seconds: 1),
    );
  }
}
