class ReadBook {
  final String id;
  final String title;
  final String author;
  final String description;
  final double rating;

  ReadBook({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.rating,
  });

  factory ReadBook.fromFirestore(String id, Map<String, dynamic> data) {
    return ReadBook(
      id: id,
      title: data['title'],
      author: data['author'],
      description: data['description'],
      rating: (data['rating'] ?? 0).toDouble(),
    );
  }
}
