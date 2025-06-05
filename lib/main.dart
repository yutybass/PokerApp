import 'package:flutter/material.dart';

void main() {
  runApp(const PokerHandRecorderApp());
}

class PokerHandRecorderApp extends StatelessWidget {
  const PokerHandRecorderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poker Hand Recorder',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HandListPage(),
    );
  }
}

class HandListPage extends StatefulWidget {
  const HandListPage({super.key});

  @override
  State<HandListPage> createState() => _HandListPageState();
}

class _HandListPageState extends State<HandListPage> {
  final List<String> _hands = [];

  void _addHand(String hand) {
    setState(() {
      _hands.add(hand);
    });
  }

  void _showAddHandDialog() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('New Hand'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Describe the hand'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              final text = controller.text.trim();
              if (text.isNotEmpty) {
                _addHand(text);
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Poker Hands'),
      ),
      body: ListView.builder(
        itemCount: _hands.length,
        itemBuilder: (_, index) => ListTile(title: Text(_hands[index])),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddHandDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
