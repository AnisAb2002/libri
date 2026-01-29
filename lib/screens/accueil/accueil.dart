import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../alire/alire.dart';
import '../lus/lus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Titre Libri
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Libri',
                style: TextStyle(
                  fontSize: 40, // taille plus grande
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            // Boutons Livres lus et Wishlist
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800], // fond plus foncé
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ReadBooksScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Livres lus',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WishlistScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'À lire',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // Bouton Déconnexion tout en bas
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text(
                    'Déconnexion',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
