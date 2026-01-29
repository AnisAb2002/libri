import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../models/livre_lu_model.dart';
import 'ajouter_livre_lu.dart';

class ReadBooksScreen extends StatelessWidget {
  const ReadBooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Livres lus")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddReadBookScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<ReadBook>>(
        stream: FirestoreService().readBooksStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final books = snapshot.data!;

          if (books.isEmpty) {
            return const Center(child: Text("Aucun livre"));
          }

          return ListView.builder(
          itemCount: books.length,
          itemBuilder: (_, i) {
            final b = books[i];
            return Dismissible(
              key: Key(b.id),
              onDismissed: (_) => FirestoreService().deleteReadBook(b.id),
              child: ListTile(
                title: Text(b.title),
                subtitle: Text("${b.author} ⭐ ${b.rating}"),
              ),
            );
          },
        );

          
        },
      ),
    );
  }
}
