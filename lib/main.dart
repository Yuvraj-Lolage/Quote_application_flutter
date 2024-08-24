import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() => runApp(const MaterialApp(
      home: Quotes(),
    ));

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  // List<String> quotes = ['Yuvraj', 'swarali', 'tommy'];
  List<Quote> quotes = [
    Quote(text: 'Mala tras Devu nkos', author: 'Swarali'),
    Quote(text: 'Mala bor hoty khup', author: 'Yuvraj'),
    Quote(text: 'Happy family', author: 'Shaila'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 242, 242, 242),
      appBar: AppBar(
        title: const Text(
          'Task manager',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 46, 159, 144),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: quotes
            .map((quote) => QuoteCard(
                  quote: quote,
                  delete: () {
                    setState(() {
                      quotes.remove(quote);
                    });
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 46, 159, 144),
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 35,
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        items: [
          const Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.favorite,
            color: Colors.grey[400],
          ),
          Icon(
            Icons.my_library_add_rounded,
            color: Colors.grey[400],
          ),
        ],

        // backgroundColor: const Color.fromRGBO(46, 159, 144, 100),
        color: const Color.fromARGB(255, 255, 255, 255),
        buttonBackgroundColor: const Color.fromARGB(255, 46, 159, 144),
        backgroundColor: const Color.fromARGB(255, 242, 242, 242),
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}
