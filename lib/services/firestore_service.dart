import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/livre_lu_model.dart';
import '../models/livre_alire_model.dart';

class FirestoreService {
  final _db = FirebaseFirestore.instance;

  String get _uid {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) throw Exception("Utilisateur non connecté");
    return user.uid;
  }

  /// Création utilisateur
  Future<void> createUser(String email) async {
    await _db.collection('users').doc(_uid).set({
      'email': email,
      'createdAt': Timestamp.now(),
    });
  }

  /// Ajouter livre lu
  
  Future<void> addReadBook({
  required String title,
  required String author,
  String? description,
  String? image,
  required double rating,
  }) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) throw Exception("Utilisateur non connecté");

  await _db.collection('users').doc(user.uid).collection('read_books').add({
    'title': title,
    'author': author,
    'description': description ?? '',
    'rating': rating,
    'createdAt': Timestamp.now(),
  });
  }


  /// Ajouter livre wishlist
  Future<void> addWishlistBook({
    required String title,
    required String author,
  }) async {
    await _db.collection('users').doc(_uid).collection('wishlist').add({
      'title': title,
      'author': author,
      'createdAt': Timestamp.now(),
    });
  }

  /// Supprimer livre lu
  Future<void> deleteReadBook(String docId) async {
    await _db
        .collection('users')
        .doc(_uid)
        .collection('read_books')
        .doc(docId)
        .delete();
  }

  /// Supprimer wishlist
  Future<void> deleteWishlistBook(String docId) async {
    await _db
        .collection('users')
        .doc(_uid)
        .collection('wishlist')
        .doc(docId)
        .delete();
  }

  /// Lire livres lus en temps réel
  Stream<List<ReadBook>> readBooksStream() {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return const Stream.empty();

  return _db
      .collection('users')
      .doc(user.uid)
      .collection('read_books')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ReadBook.fromFirestore(doc.id, doc.data()))
          .toList());
}


  /// Lire wishlist en temps réel
  Stream<List<Book>> wishlistStream() {
    return _db
        .collection('users')
        .doc(_uid)
        .collection('wishlist')
        .snapshots()
        .map((snapshot) =>
            snapshot.docs.map((doc) => Book.fromFirestore(doc.id, doc.data())).toList());
  }
}
