import 'package:flutter/material.dart';

class CreateNote extends StatelessWidget {
  CreateNote({super.key});

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text('Create Note'),
        actions: [
          IconButton(
              onPressed: () {
                _formkey.currentState!.validate();
                if(!_formkey.currentState!.validate()) {
                  return;
                }
              },
              icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some valid email';
                    }
                    return null;
                  }),
              Expanded(
                child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Content',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some valid email';
                      }
                      return null;
                    }),
              ),
              ElevatedButton(
                onPressed: () {
                  // Add note to database
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}