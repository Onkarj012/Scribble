import 'package:flutter/material.dart';
import 'package:my_notes/AuthService/auth_service.dart';
import 'package:my_notes/screens/sign_up.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String id = '';
  String password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: Center(

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            color: Colors.white30,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration:const InputDecoration(
                            label: Text("ID",style: TextStyle(color: Colors.white),),
                          ),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !value.contains('@')) {
                              return 'Please enter some valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            id != value!;
                          },
                        ),
                        TextFormField(
                          decoration:const InputDecoration(
                            label: Text("Password",style: TextStyle(color: Colors.white),),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 7) {
                              return 'Please enter some valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            password != value!;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _formKey.currentState!.validate();
                    if(!_formKey.currentState!.validate()){
                      return ;
                    }
                    _formKey.currentState!.save();
                    AuthService().signInWithEmail(id, password);
                  },
                  child: const Text('submit'),
                ),
                IconButton(
                    onPressed: () {
                      AuthService().signInWithGoogle(context);
                    },
                    icon: const Icon(Icons.login)
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                    },
                    child: Text("Create user"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


