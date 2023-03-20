import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../state/app_state.dart';

class LoginForm extends StatefulWidget{
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm>{
  final myController = TextEditingController();

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    String name;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            const Text(
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              'Personal Dashboard',
            ),
            Form(
              key: formKey,
              child: TextFormField(
                controller: myController,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () => {
                    if(formKey.currentState!.validate()){
                      appState.login(myController.text)
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      style: TextStyle(fontSize: 16),
                      "Get started !",
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}