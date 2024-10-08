import 'package:bookstore/models/cart_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/models/book.dart';
import 'package:intl/intl.dart';

class Store extends ChangeNotifier {
  //list of book items
  final List<Book> _menu = [
    //novels
    Book(name: "The Da Vinci Code",
        author: "Dan Brown",
        imagePath: "lib/images/novels/DaVinciCode.jpg",
        price: 440.00,
        about: "This mystery-thriller novel published in 2003, follows Robert Langdon, a Harvard symbologist. The story begins with a murder at the Louvre Museum in Paris and takes readers on a fast-paced journey through Europe, uncovering secrets that could shake the foundations of Christianity. The novel is known for its blend of historical references, puzzles, and suspense.",
        category: BookCategory.novels),
    Book(name: "Harry Potter and the Sorcerer's Stone",
        author: "J.K. Rowling",
        imagePath: "lib/images/novels/HarryPotter.jpg",
        price: 530.00,
        about: "The first book in the Harry Potter series published in 1997,  introduces readers to the young wizard Harry Potter, who discovers on his eleventh birthday that he is a wizard and has been accepted to Hogwarts School of Witchcraft and Wizardry. As he begins his magical education, Harry uncovers the truth about his parents' mysterious deaths and his own connection to the dark wizard Voldemort. The novel is a rich blend of fantasy. ",
        category: BookCategory.novels),
    Book(name: "The Alchemist",
        author: "Paulo Coelho",
        imagePath: "lib/images/novels/TheAlchemist.jpg",
        price: 365.00,
        about: "The Alchemist published in 1988, is an allegorical novel that follows the journey of Santiago, a young Andalusian shepherd, who dreams of finding a treasure located in the Egyptian pyramids. As he sets off on his quest, Santiago encounters various characters, each imparting wisdom and helping him understand the deeper meanings of life. The novel is a philosophical exploration of destiny and dreams",
        category: BookCategory.novels),
    Book(name: "1984",
        author: "George Orwell",
        imagePath: "lib/images/novels/1984.jpg",
        price: 520.00,
        about: "1984 is a dystopian novel published in 1949, set in a totalitarian state where the government, led by the Party and its leader Big Brother. The protagonist, Winston Smith, works at the Ministry of Truth, altering historical records to fit the Party's propaganda. The book is a chilling exploration of surveillance, censorship, and the manipulation of truth.",
        category: BookCategory.novels),
    Book(name: "The Shining",
        author: "Stephen King",
        imagePath: "lib/images/novels/TheShining.jpg",
        price: 400.00,
        about: "The Shining published in 1977, is a classic horror novel that tells the story of Jack Torrance, an aspiring writer and recovering alcoholic who takes a job as the winter caretaker of the isolated Overlook Hotel. He moves into the hotel with his wife, Wendy, and his young son, Danny, who possesses a psychic ability known as 'the shining', which allows him to see the terrifying secrets of the hotel. ",
        category:BookCategory.novels ),

    //history
    Book(name: "Sapiens: A Brief History of Humankind",
        author: "Yuval Noah Harari",
        imagePath: "lib/images/history/Sapiens.jpg",
        price: 580.00,
        about: "This book published in 20011, offers a sweeping overview of human history, from the emergence of Homo sapiens in the Stone Age to the present day. Harari explores how humans have developed societies, cultures, and technologies, and how these developments have shaped our world. The book is known for its engaging narrative and thought-provoking insights into the nature of humanity",
        category: BookCategory.history),
    Book(name: "The Anarchy",
        author: "William Dalrymple",
        imagePath: "lib/images/history/TheAnarchy.jpg",
        price: 420.00,
        about: "This book published in 2019, explores the rise of the British East India Company and its transformation from a trading corporation into a powerful entity that effectively ruled large parts of India. William Dalrymple provides a gripping account of how a private company came to dominate an entire subcontinent, leading to significant political and social changes in India. The book is well-researched and offers insights into a crucial period of Indian history.",
        category: BookCategory.history),
    Book(name: "India After Gandhi",
        author: "Ramachandra Guha",
        imagePath: "lib/images/history/IndiaAfterGandhi.jpg",
        price: 390.00,
        about: "Originally published in 2007, this updated edition covers the history of India from the time of independence in 1947 to the present day. Ramachandra Guha provides a comprehensive account of India's political, social, and economic developments, examining how the country has navigated challenges and evolved into the world's largest democracy. The book is known for contemporary Indian history.",
        category: BookCategory.history),
    Book(name: "Revolutionary Ideas",
        author: "by Jonathan Israel",
        imagePath: "lib/images/history/RevolutionaryIdeas.jpg",
        price: 475.00,
        about: "Revolutionary Ideas: An Intellectual History of the French Revolution from The Rights of Man to Robespierre, published in 2022 . Jonathan Israel examines the philosophical and intellectual currents that shaped the French Revolution. The book explores how revolutionary ideas evolved and their impact on the course of the revolution and subsequent historical developments.",
        category: BookCategory.history),
    Book(name: "The War That Ended Peace",
        author: "Margaret MacMillan",
        imagePath: "lib/images/history/TheWar.jpg",
        price: 560.00,
        about: "The War That Ended Peace: The Road to 1914 published in 2013.While focusing on the events leading up to World War I, this book provides crucial context for understanding the causes of the conflict. Margaret MacMillan examines the political, social, and diplomatic factors that contributed to the outbreak of the war.",
        category:BookCategory.history ),

    //selfhelp
    Book(name: "Dare to Lead",
        author: "by Brené Brown",
        imagePath: "lib/images/selfhelp/DareToLead.jpg",
        price: 395.00,
        about: "'Dare to Lead: Brave Work, Tough Conversations, Whole Hearts', by Brené Brown published in 2018.  Brené Brown explores the principles of effective leadership and the importance of vulnerability, courage, and empathy in creating a positive work culture. The book offers insights and tools for leading with authenticity and fostering meaningful connections.",
        category: BookCategory.selfhelp),
    Book(name: "How to Do the Work",
        author: "Dr. Nicole LePera",
        imagePath: "lib/images/selfhelp/HowToDo.jpg",
        price: 430.00,
        about: "How to Do the Work: Recognize Your Patterns, Heal from Your Past, and Create Your Self, published in 2021.Dr. Nicole LePera provides a holistic approach to self-healing and personal growth. The book combines insights from psychology and practical exercises to help readers identify and address underlying issues, build healthier habits, and create positive change in their lives.",
        category: BookCategory.selfhelp),
    Book(name: "Atomic Habits",
        author: "James Clear",
        imagePath: "lib/images/selfhelp/AtomicHabits.jpg",
        price: 588.00,
        about: "Atomic Habits: An Easy & Proven Way to Build Good Habits & Break Bad Ones, published in 2018.  James Clear provides practical strategies for forming good habits, breaking bad ones, and mastering the tiny behaviors that lead to remarkable results. The book emphasizes the power of small changes and how they can lead to significant improvements over time",
        category: BookCategory.selfhelp),
    Book(name: "Grit",
        author: "Angela Duckworth",
        imagePath: "lib/images/selfhelp/Grit.jpg",
        price: 455.00,
        about: "Angela Duckworth's Grit published in 2016, explores the concept of grit—passion and perseverance—as a key predictor of success. Duckworth argues that talent alone is not enough to achieve long-term goals; instead, sustained effort and dedication are crucial. The book combines scientific research with real-life stories to demonstrate how grit can be developed and harnessed.",
        category: BookCategory.selfhelp),
    Book(name: "The Power of Now",
        author: "Eckhart Tolle",
        imagePath: "lib/images/selfhelp/PowerOfNow.jpg",
        price: 568.00,
        about: "Eckhart Tolle's The Power of Now, published in 1997, emphasizes the importance of living in the present moment to achieve inner peace and spiritual awakening. Tolle explores how focusing on the present can help overcome negative thoughts and emotional suffering. The book offers practical guidance on how to detach from the mind’s chatter and embrace the now.",
        category: BookCategory.selfhelp),

    //biography
    Book(name: "Steve Jobs",
        author: "Walter Isaacson",
        imagePath: "lib/images/biography/SteveJobs.jpg",
        price: 350.00,
        about: "Walter Isaacson's biography of Steve Jobs published in 2011, is based on extensive interviews with Jobs, as well as with his family, friends, and colleagues. The book chronicles Jobs’ life, from his early years and the founding of Apple to his visionary leadership and struggles with illness. It provides a detailed portrait of a complex individual whose innovations transformed technology and the way we live.",
        category: BookCategory.biography),
    Book(name: "The Wright Brothers",
        author: "David McCullough",
        imagePath: "lib/images/biography/WrightBrothers.jpg",
        price: 355.00,
        about: "The Wright Brothers published in 2015, David McCullough tells the story of Wilbur and Orville Wright, the brothers who pioneered human flight. Drawing on extensive research and primary sources, McCullough provides a vivid narrative of their lives, the challenges they faced, and their ultimate triumph in inventing the airplane.",
        category: BookCategory.biography),
    Book(name: "Leonardo da Vinci",
        author: "Walter Isaacson",
        imagePath: "lib/images/biography/DaVinci.jpg",
        price: 420.00,
        about: "Walter Isaacson’s biography of Leonardo da Vinci published in 2017, offers a vivid portrayal of the Renaissance genius, exploring his diverse talents in art, science, engineering, and anatomy. Drawing on Leonardo’s notebooks and other historical records, Isaacson reveals the artist’s creative process, intellectual curiosity, and contributions to various fields",
        category: BookCategory.biography),
    Book(name: "The Diary of a Young Girl",
        author: "Anne Frank",
        imagePath: "lib/images/biography/Diary.jpg",
        price: 340.00,
        about: "This world-renowned book is the diary of Anne Frank, a Jewish girl who went into hiding with her family during the Nazi occupation of the Netherlands. Written during the two years she spent in hiding, the diary offers a poignant and personal account of life during the Holocaust, as well as Anne’s thoughts and hopes for the future.",
        category: BookCategory.biography),
    Book(name: "The Glass Castle",
        author: "Jeannette Walls",
        imagePath: "lib/images/biography/GlassCastle.jpg",
        price: 435.00,
        about: "The Glass Castle is a memoir by Jeannette Walls published in 2005, recounting her unconventional and often difficult childhood. Raised by eccentric, nonconformist parents, Walls describes her experiences of poverty, resilience, and survival. The memoir is both a harrowing and uplifting story of a family's struggle and Walls' determination to overcome her circumstances.",
        category: BookCategory.biography),

    //poetry
    Book(name: "The Sun and Her Flowers",
        author: "Rupi Kaur",
        imagePath: "lib/images/poetry/SunAndFlowers.jpg",
        price: 330.00,
        about: "Rupi Kaur’s The Sun and Her Flowers published in 2017, is a collection of poems that explores themes of growth, healing, ancestry, and self-love. The book is divided into five sections, each representing a stage of growth and transformation. Kaur’s minimalist style and emotionally resonant themes have made this collection widely popular, especially among young readers.",
        category: BookCategory.poetry),
    Book(name: "The Essential Rumi",
        author: "Jalaluddin Rumi",
        imagePath: "lib/images/poetry/EssentialRumi.jpg",
        price: 400.00,
        about: "The Essential Rumi published in 1995, this book features the poetry of the 13th-century Persian poet Rumi, translated by Coleman Barks. Rumi’s mystical and spiritual poetry, has captivated readers for centuries. Barks’ translations have brought Rumi’s work to a wide audience, making him one of the best-selling poets in the English language.",
        category: BookCategory.poetry),
    Book(name: "Milk and Honey",
        author: "Rupi Kaur",
        imagePath: "lib/images/poetry/MilkAndHoney.jpg",
        price: 380.00,
        about: "Milk and Honey is Rupi Kaur’s debut poetry collection published in 2014, that delves into themes of love, loss, trauma, healing, and femininity. Divided into four sections, the poems cover various aspects of life, from pain and heartbreak to self-discovery and empowerment. Kaur’s simple yet profound writing style and her illustrations have made this book a global bestseller.",
        category: BookCategory.poetry),
    Book(name: "All About Love",
        author: "bell hooks",
        imagePath: "lib/images/poetry/AllAboutLove.jpg",
        price: 410.00,
        about: "In All About Love: New Visions, bell hooks explores the concept of love from a multifaceted perspective, combining personal anecdotes, cultural criticism, and philosophical reflections. The book challenges traditional notions of love and emphasizes the importance of love as a transformative and radical force in both personal and societal contexts. ",
        category: BookCategory.poetry),
    Book(name: "Wild Embers",
        author: "Nikita Gill",
        imagePath: "lib/images/poetry/WildEmbers.jpg",
        price: 370.00,
        about: "Nikita Gill’s Wild Embers published in 2017,  presents a collection of poems that blend themes of love, empowerment, and resilience. The verses are known for their evocative imagery and powerful messages about embracing one’s inner strength and navigating the complexities of love and self-worth.",
        category: BookCategory.poetry),
  ];

  // user cart
  final List<CartItem> _cart = [];

  //delivery address
  String _deliveryAddress = '12/102B Ritapuram';

  //GETTERS:
  List<Book> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  //OPERATIONS:

  //add to cart
  void addToCart(Book book) {
    // see if there is a cart item already with the same book
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the books are same
      bool isSameBook = item.book == book;
      return isSameBook;
    });
    // if the book already exists, increase its quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    //otherwise add a new cart
    else {
      _cart.add(
        CartItem(
            book: book),
      );
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if(_cart[cartIndex].quantity>1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  //get total price of cart
  double getTotalPrice() {
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.book.price;
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //get total number of items
  int getTotalItemCount() {
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  //clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //HELPERS
  //generate a receipt
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here is your receipt");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("                 --------------------");

    for (final cartItem in _cart) {
      receipt.writeln(
        "${cartItem.quantity} x ${cartItem.book.name} - ${_formatPrice(cartItem.book.price)}"
      );
      receipt.writeln();
    }
    receipt.writeln("                 --------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  //total double value into money
  String _formatPrice(double price) {
    return "Rs. ${price.toStringAsFixed(2)}";
  }

}