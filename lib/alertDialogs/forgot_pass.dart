import 'package:flutter/material.dart';

import '../models/api_models.dart';
import '../services/http.service.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ForgotPassword();
}

class _ForgotPassword extends State<ForgotPassword> {
  final email = TextEditingController();
  continueClick() {
    var reqParams = {
      'apiKey': HttpServices().apiKey,
      'emailAddress': email.text,
    };
    var response = HttpServices().post(ApiModels().forgot_pass, reqParams);
    print(response);
    if (response.toString().isNotEmpty) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Forgot Password ?',
          style: TextStyle(
              fontSize: 20.0, color: Colors.blue, fontWeight: FontWeight.bold)),
      content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
                padding: EdgeInsets.all(15.0),
                child: const Text(
                    "Enter your email address then press Continue, we'll email you a link to a page where you can easily create a new password.",
                    style: TextStyle(fontSize: 12.0, color: Colors.blue))),
            Padding(
                padding: EdgeInsets.all(15.0),
                child: TextField(
                  controller: email,
                  cursorColor: Colors.blue,
                  obscureText: false,
                  decoration: const InputDecoration(
                    // border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                  // validator: (value) {
                  // if (value!.isEmpty) {
                  //   return 'Please enter password';
                  // } else if (password!.text.length < 5) {
                  //   return 'Please lenght should not less than 5';
                  // }

                  // onInputChange();
                  // },
                  onTap: () => {},
                ))
          ]),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => {continueClick()},
          child: const Text('Continue'),
        ),
      ],
    );
  }
}
