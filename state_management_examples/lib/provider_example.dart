import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemListModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void addItem(String newItem) {
    _items.add(newItem);
    notifyListeners(); // Değişiklikleri dinleyicilere bildir
  }
}

class ProviderExample extends StatelessWidget {
  const ProviderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
      ),
      body: Consumer<ItemListModel>(
        builder: (context, model, child) {
          return ListView.builder(
            itemCount: model.items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(model.items[index]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddItemDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddItemDialog(BuildContext context) {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Item'),
          content: TextField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Enter item'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Add'),
              onPressed: () {
                Provider.of<ItemListModel>(context, listen: false)
                    .addItem(textController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
