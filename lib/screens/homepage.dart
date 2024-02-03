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
      backgroundColor: Colors.black87,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: SingleChildScrollView(
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
                          Image.network(
                              'https://i.pinimg.com/originals/52/8e/29/528e2946f76a74030660b231c7ff1dc1.png',
                          ),
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
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black87,
                    ),
                    onPressed: () {
                      _formKey.currentState!.validate();
                      if(!_formKey.currentState!.validate()){
                        return ;
                      }
                      _formKey.currentState!.save();
                      AuthService().signInWithEmail(id, password);
                    },
                    child: const Text('submit' , style: TextStyle(color: Colors.blue),),
                  ),
                  IconButton(
                      onPressed: () {
                        AuthService().signInWithGoogle(context);
                      },
                      icon: const Icon(Icons.login,color: Colors.blue,)
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child: Text("Create user",style: TextStyle(color: Colors.blue),),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


