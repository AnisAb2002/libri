import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../accueil/accueil.dart';
import 'auth.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {

        // Chargement
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        // Utilisateur connecté
        if (snapshot.hasData) {
          return const HomeScreen();
        }

        // Non connecté
        return const AuthPage();
      },
    );
  }
}
