class Book {
  final String name;
  final String author;
  final String imagePath;
  final double price;
  final String about;
  final BookCategory category;

  Book({required this.name,required this.author,required this.imagePath,
  required this.price, required this.about, required this.category});
}
// Book Genres
enum BookCategory{
  novels,
  history,
  selfhelp,
  biography,
  poetry,
}
