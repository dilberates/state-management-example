// setState Example Widget
import 'package:flutter/material.dart';

class SetStateExample extends StatefulWidget {
  const SetStateExample({super.key});

  @override
  _SetStateExampleState createState() => _SetStateExampleState();
}

class _SetStateExampleState extends State<SetStateExample> {
  String _text = '';
  String _savedText = '';

  void _saveText() {
    setState(() {
      _savedText = _text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setState Example'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _text = value; // Textfield'deki metni güncelle
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Enter your text',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveText,
              child: const Text('Save'),
            ),
            const SizedBox(height: 20),
            Text('Saved Text: $_savedText'), // Kaydedilen metni göster
             Text('Text: $_text')
          ],
        ),
      ),
    );
  }
}
