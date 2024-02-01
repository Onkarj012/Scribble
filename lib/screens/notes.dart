import 'package:flutter/material.dart';
import 'package:my_notes/data/dummy_data.dart';

class Notes extends StatelessWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
            'Notes',
            style: TextStyle(color: Colors.blue),
        ),
      ),

      body: GridView.builder(

          itemCount: notesData.length,
          itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                child: ListTile(

                  tileColor: Colors.black87,
                  title: Text(
                    notesData[index]['title']!,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    notesData[index]['content']!,
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              )),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.blue,

        ),
        backgroundColor: Colors.white30,
      ),
    );
  }
}
