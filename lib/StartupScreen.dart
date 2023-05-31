import 'dart:async';
import 'package:flutter/material.dart';

import 'Global.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  _StartupScreenState createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {


  String currentQuote = '';
  String mood = '';

  late Timer quoteTimer;

  @override
  void initState() {
    super.initState();
    fetchRandomQuote();
    startQuoteTimer();
  }

  @override
  void dispose() {
    stopQuoteTimer();
    super.dispose();
  }

  void startQuoteTimer() {
    quoteTimer = Timer.periodic(const Duration(seconds: 10), (_) {
      fetchRandomQuote();
    });
  }

  void stopQuoteTimer() {
    quoteTimer?.cancel();
  }

  void fetchRandomQuote() {
    final random = Global.quotes[DateTime.now().second % Global.quotes.length];
    setState(() {
      currentQuote = random.text;
      mood = random.mood;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.green.shade200,
        child: ListView(
          children: [
            DrawerHeader(
              child: Image.network(
                "https://previews.123rf.com/images/enterline/enterline1611/enterline161100216/66186863-the-word-mood-concept-and-theme-painted-in-watercolor-ink-on-a-white-paper.jpg",
                fit: BoxFit.cover,
              ),
            ),
            ListTile(
              title: const Text("Sad"),
            ),
            ListTile(
                title: const Text("Happy"),
               ),
            ListTile(
                title: const Text("Angry"),
               ),
          ],
        ),
      ),
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        centerTitle: true,
        title: const Text('Mood Quotes App'),
        backgroundColor: Colors.green.shade200,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
              ),
              child: Text(
                mood,
                style: const TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 300,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
              ),
              child: Text(
                currentQuote,
                style: const TextStyle(fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
