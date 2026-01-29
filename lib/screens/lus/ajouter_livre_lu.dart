import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';

class AddReadBookScreen extends StatefulWidget {
  const AddReadBookScreen({super.key});

  @override
  State<AddReadBookScreen> createState() => _AddReadBookScreenState();
}

class _AddReadBookScreenState extends State<AddReadBookScreen> {
  final titleCtrl = TextEditingController();
  final authorCtrl = TextEditingController();
  final descCtrl = TextEditingController();
  double rating = 3;


  /// Enregistrer le livre et l'image
  Future<void> save() async {
  try {

    await FirestoreService().addReadBook(
      title: titleCtrl.text,
      author: authorCtrl.text,
      description: descCtrl.text,
      rating: rating,
    );

    Navigator.pop(context);
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Erreur ajout livre : $e")),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ajouter un livre lu")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: "Titre")),
          TextField(controller: authorCtrl, decoration: const InputDecoration(labelText: "Auteur")),
          TextField(controller: descCtrl, decoration: const InputDecoration(labelText: "Description")),
          const SizedBox(height: 10),
          const SizedBox(height: 10),
          Slider(
            value: rating,
            min: 1,
            max: 5,
            divisions: 4,
            label: rating.toString(),
            onChanged: (v) => setState(() => rating = v),
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: save, child: const Text("Enregistrer")),
        ],
      ),
    );
  }
}
