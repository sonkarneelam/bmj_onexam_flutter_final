import 'dart:js_interop';

import 'package:bmj_onexamination/models/api_models.dart';
import 'package:bmj_onexamination/services/http.service.dart';
import 'package:flutter/material.dart';

import '../alertDialogs/forgot_pass.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final formFiled = GlobalKey<FormState>();
  var buttonEnable = false;
  final email = TextEditingController();
  final password = TextEditingController();

  navigate() {
    var reqParams = {
      'apiKey': HttpServices().apiKey,
      'emailAddress': email.text,
      'password': password.text
    };
    var response = HttpServices().post(ApiModels().login, reqParams);
    print(response);
    if (response.toString().isNotEmpty) {
      Navigator.of(context).pushReplacementNamed('/dashboard');
    }
  }

  createAccount() {
    Navigator.of(context).pushNamed('/createaccount');
  }

  onInputChange() {
    if (!!this.buttonEnable) {
      // navigate();
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('')),
        body: Container(
            child: Form(
          onChanged: () => {},
          key: formFiled,
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: SizedBox(
                        width: 280,
                        height: 80,
                        child: Image(
                          image: AssetImage('images/bmj-logo.png'),
                          width: 100.0,
                        ))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          cursorColor: Colors.blue,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: InkWell(
                              child: Icon(Icons.cancel_rounded),
                            ), //,
                            suffixIconColor: Colors.blue,
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            bool emailValidate = RegExp(
                                    // ignore: unnecessary_string_escapes
                                    "^[a-zA-Z0-9.!#%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*")
                                .hasMatch(value!);
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            } else if (!emailValidate) {
                              return 'Enter valid email';
                            }
                          },
                          onTap: () => {},
                          onChanged: (value) => this.buttonEnable =
                              value!.length >= 5 ? true : false,
                        ))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: password,
                          cursorColor: Colors.blue,
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            } else if (password!.text.length < 1) {
                              return 'Please lenght should not less than 5';
                            }
                          },
                          onTap: () => {},
                          onChanged: (value) => this.buttonEnable =
                              value!.length >= 5 ? true : false,
                        ))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FilledButton(
                      style: const ButtonStyle(
                          // foregroundColor:
                          //     MaterialStatePropertyAll(Colors.white),
                          // backgroundColor:
                          //     MaterialStatePropertyAll(Colors.blue),
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(20))),
                      onPressed: () {
                        navigate();
                      }, //!!buttonEnable ? navigate() : null,
                      child: const Text('Sign In'),
                    )),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15.0),
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.transparent),
                          onPressed: () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) =>
                                  ForgotPassword()),
                          child: const Text("Forgot Password ?"),
                        ))),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15.0),
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.transparent),
                          onPressed: () {
                            createAccount();
                          },
                          child: const Text("Don't have an account ?"),
                        ))),
              ]),
        )));
  }
}
