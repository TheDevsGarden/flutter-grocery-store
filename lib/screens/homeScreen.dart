import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_flutter/firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_flutter/screens/login.dart';

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
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final Panier panier = Panier();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('List with Hero Transition'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Produits"),
              Tab(text: "Panier"),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                );
              },
            ),
          ],
        ),
        body: TabBarView(
          children: [
            ListeProduits(panier: panier),
            PanierScreen(panier: panier),
          ],
        ),
      ),
    );
  }
}

class EcranDetailsProduit extends StatelessWidget {
  final String imageUrl;
  final String nom;
  final int note;
  final String explication;
  final Panier panier;

  EcranDetailsProduit({
    required this.imageUrl,
    required this.nom,
    required this.note,
    required this.explication,
    required this.panier,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de l\'article'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(imageUrl),
            SizedBox(height: 16),
            Text(
              nom,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Note: $note',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              explication,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                panier.addItem(nom);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Article ajouté au panier'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              child: Text('Ahouter au panier'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListeProduits extends StatelessWidget {
  final Panier panier;

  ListeProduits({required this.panier});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('produits').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        final List<DocumentSnapshot> documents = snapshot.data!
            .docs; //DocumentsSnapshot est une liste de documents, le ! dans snapshot.data! veut dire que snapshot.data ne peut pas etre null

        return ListView.builder(
          itemCount: documents.length,
          itemBuilder: (context, index) {
            String imageUrl = documents[index].get("image");
            if (imageUrl == null || imageUrl.isEmpty) {
              imageUrl =
                  "https://upload.wikimedia.org/wikipedia/commons/7/70/Coffee_in_a_cup_clip_art.png";
            }
            int note = documents[index].get("note");
            Color noteColor = Colors.green;
            if (note >= 60 && note <= 100) {
              noteColor = Colors.green;
            } else if (note >= 40 && note <= 59) {
              noteColor = Colors.orange;
            } else if (note >= 0 && note <= 39) {
              noteColor = Colors.red;
            }

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EcranDetailsProduit(
                      imageUrl: imageUrl,
                      nom: documents[index].get("nom"),
                      note: documents[index].get("note"),
                      explication: documents[index].get("description"),
                      panier: panier,
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: Image.network(imageUrl),
                title: Text(documents[index].get("nom")),
                subtitle: Text(
                  documents[index].get("note").toString(),
                  style: TextStyle(color: noteColor),
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    panier.addItem(documents[index].get("nom"));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Article ajouté au panier'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Text('Ajouter au panier'),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class PanierScreen extends StatefulWidget {
  final Panier panier;

  PanierScreen({required this.panier});

  @override
  _PanierScreenState createState() => _PanierScreenState();
}

class _PanierScreenState extends State<PanierScreen> {
  late List<String> items = [];

  @override
  void initState() {
    super.initState();
    loadPanier();
  }

  Future<void> loadPanier() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> panierItems = prefs.getStringList('panier') ?? [];
    setState(() {
      items = panierItems;
    });
  }

  Future<void> savePanier() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('panier', items);
  }

  void removeItem(String item) {
    setState(() {
      items.remove(item);
      savePanier();
    });
  }

  @override
  Widget build(BuildContext context) {
    return items.isEmpty
        ? Center(
            child: Text('Le panier est vide'),
          )
        : ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    removeItem(items[index]);
                  },
                ),
              );
            },
          );
  }
}

class Panier {
  List<String> _items = [];

  List<String> get items => _items;

  Future<void> addItem(String item) async {
    _items.add(item);
    await savePanier();
  }

  Future<void> removeItem(String item) async {
    _items.remove(item);
    await savePanier();
  }

  Future<void> loadPanier() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> panierItems = prefs.getStringList('panier') ?? [];
    _items = panierItems;
  }

  Future<void> savePanier() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('panier', _items);
  }
}
