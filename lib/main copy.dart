import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List with Hero Transition'),
        ),
        body: ItemList());
  }
}

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      // StreamBuilder is used to get data from firestore, it will automatically update the data when there is a change in firestore. QuerySnapshot is used to get the data from firestore. it is similar to DocumentSnapshot but it is used to get multiple documents.
      stream: FirebaseFirestore.instance.collection('cours').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return Center(
              child:
                  CircularProgressIndicator()); // CircularProgressIndicator is used to show the progress of the task.
        }

        final List<DocumentSnapshot> documents = snapshot.data!.docs;

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            final item = documents[index].get(
                "nom"); // this is final because we are using it in the Hero widget.

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context, // we pass the context
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                        item:
                            item), // Detail Screen is defined in the next step.
                  ),
                );
              },
              child: ListTile(
                leading: Hero(
                  tag: 'item_$item',
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                title: Text(item),
              ),
            );
          },
        );
      },
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String item;

  DetailScreen(
      {required this.item}); //this.item refers to the item defined in the above class.

  @override // we are overriding the build method here. Because we are using StatelessWidget. Without overriding the build method, we will get an error.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: Hero(
          tag: 'item_$item',
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            child: Text(
              item,
              style: TextStyle(color: Colors.white),
            ),
            radius: 50,
          ),
        ),
      ),
    );
  }
}
