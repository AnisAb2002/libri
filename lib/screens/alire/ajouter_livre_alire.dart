import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';

class AddWishlistBook extends StatefulWidget { // ✅ Nom exact ici
  const AddWishlistBook({super.key});

  @override
  State<AddWishlistBook> createState() => _AddWishlistBookState();
}

class _AddWishlistBookState extends State<AddWishlistBook> {
  final titleCtrl = TextEditingController();
  final authorCtrl = TextEditingController();

  Future<void> save() async {
    await FirestoreService().addWishlistBook(
      title: titleCtrl.text,
      author: authorCtrl.text,
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ajouter à la wishlist")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: titleCtrl, decoration: const InputDecoration(labelText: "Titre")),
            TextField(controller: authorCtrl, decoration: const InputDecoration(labelText: "Auteur")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: save, child: const Text("Ajouter")),
          ],
        ),
      ),
    );
  }
}
