import 'package:flutter/material.dart';
import '../../services/firestore_service.dart';
import '../../models/livre_alire_model.dart';
import 'ajouter_livre_alire.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Wishlist")),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AddWishlistBook(), // ✅ plus de const
            ),
          );
        },
      ),
      body: StreamBuilder<List<Book>>(
        stream: FirestoreService().wishlistStream(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final books = snapshot.data!;

          return ListView.builder(
            itemCount: books.length,
            itemBuilder: (_, i) {
              final b = books[i];
              
              return Dismissible(
                key: Key(b.id),
                direction: DismissDirection.endToStart,
                onDismissed: (_) async {
                  await FirestoreService().deleteWishlistBook(b.id);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Livre supprimé de la wishlist")),
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                child: ListTile(
                  title: Text(b.title),
                  subtitle: Text(b.author),
                ),
              );


            },
          );
        },
      ),
    );
  }
}
