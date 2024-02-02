import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();

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
                    padding: EdgeInsets.all(20),
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
                  },
                  child: const Text('submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


