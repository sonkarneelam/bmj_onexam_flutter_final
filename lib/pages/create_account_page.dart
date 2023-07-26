import 'package:bmj_onexamination/models/api_models.dart';
import 'package:flutter/material.dart';

import '../services/http.service.dart';

class CreateNewAccountPage extends StatefulWidget {
  const CreateNewAccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _CreateNewAccountPage();
}

class _CreateNewAccountPage extends State<CreateNewAccountPage> {
  final formFiled = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  List<String> str = [
    "8-20 Characters",
    "Both Upper and lower case letters",
    "A Number.",
    "Atleast one of these special characters '!@#%^&*_'"
  ];
  bool isChecked1 = false;
  bool isChecked2 = false;

  createAccount() {
    var requestParams = {
      "apiKey": HttpServices().apiKey,
      "emailAddress": email.text,
      "password": "",
      "communicationPreference": isChecked1,
      "ipAddress": "",
      "userName": "",
      "apiTokenExpiryDuration": {},
      "token": "",
      "examId": 0
    };
    final response =
        HttpServices().post(ApiModels().create_account, requestParams);
    print(response);
    if (response.toString().isNotEmpty) {
      Navigator.canPop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return Colors.blue;
    }

    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Create An Account')),
        body: Form(
          onChanged: () => {formFiled.currentState?.validate()},
          key: formFiled,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                        width: 350,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: email,
                          cursorColor: Colors.blue,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: InkWell(
                              child: Icon(Icons.cancel_rounded),
                              // onTap: () {
                              //   email.clear();
                              // }
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

                            // onInputChange();
                          },
                          onTap: () => {},
                        ))),
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                        width: 350,
                        child: TextFormField(
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
                            } else if (password!.text.length < 5) {
                              return 'Please lenght should not less than 5';
                            }
                          },
                          onTap: () => {},
                        ))),
                Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: SizedBox(
                        width: 350,
                        child: Text("Password must contain's:",
                            style:
                                TextStyle(color: Colors.red, fontSize: 12.0)))),
                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Column(
                      children: str.map((strone) {
                    return Row(children: [
                      Text(
                        "\u2022",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.red,
                            fontStyle: FontStyle.italic),
                      ), //bullet text
                      SizedBox(
                        width: 10,
                      ), //space between bullet and text
                      Expanded(
                        child: Text(
                          strone,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.red,
                              fontStyle: FontStyle.italic),
                        ), //text
                      )
                    ]);
                  }).toList()),
                ),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(children: [
                      Checkbox(
                        shape: CircleBorder(),
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked1,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked1 = value!;
                          });
                        },
                      ),
                      Text(
                          'I want to receive information and special offers about BMJ \nproduct and services.',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black,
                              inherit: true)),
                    ])),
                Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Row(children: [
                      Checkbox(
                        shape: CircleBorder(),
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked2,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                      ),
                      Text(
                          'I agree to the BMJ OnExamination Terms and Conditions \n & Privacy Policy.',
                          overflow: TextOverflow.fade,
                          softWrap: false,
                          style: TextStyle(
                              fontSize: 10.0,
                              color: Colors.black,
                              inherit: true)),
                    ])),
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
                      onPressed: () => {
                        // createAccount()
                        // navigate()
                      },
                      //onPressed,
                      child: const Text('Create Account'),
                    )),
              ]),
        ));
  }
}
