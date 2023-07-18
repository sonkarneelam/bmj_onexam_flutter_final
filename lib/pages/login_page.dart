import 'package:bmj_onexamination/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bmj_onexamination/route.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  navigate() {
    Navigator.of(context).pushNamed('/dashboard');
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => const MyHomePage(
    //             title: 'Dashboard',
    //           )),
    // );
  }

  var buttonEnable = false;
  var email = TextEditingController();
  var password = TextEditingController();
  onInputChange() {
    // if (email.length > 10 && password.length > 10) {
    //   buttonEnable = true;
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('')),
        body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.all(15.0),
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
                        child: TextField(
                            controller: email,
                            cursorColor: Colors.blue,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              suffixIcon: Icon(Icons.cancel_rounded),
                              suffixIconColor: Colors.blue,
                              labelText: 'Email',
                            )))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                        width: 350,
                        child: TextField(
                            controller: password,
                            cursorColor: Colors.blue,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            )))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.blue),
                          padding:
                              MaterialStatePropertyAll(EdgeInsets.all(20))),
                      onPressed: null,
                      child: Text('Sign In'),
                    )),
                Center(
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              textStyle: const TextStyle(fontSize: 15.0),
                              foregroundColor: Colors.blue,
                              backgroundColor: Colors.transparent),
                          onPressed: () {},
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
                          onPressed: () {},
                          child: const Text("Don't have an account ?"),
                        ))),
              ]),
        ));
  }
}
