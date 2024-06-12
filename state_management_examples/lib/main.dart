// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:state_management_examples/bloc_example.dart';
import 'package:state_management_examples/getx_example.dart';
import 'package:state_management_examples/provider_example.dart';
import 'package:state_management_examples/set_state_example.dart';

// Main Function
void main() {
  runApp(const MyApp());
}

// MyApp Widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemListModel()),
        //CounterModel()),
        Provider(create: (_) => FruitSelectionBloc()),
      ],
      child: const GetMaterialApp(
        title: 'Flutter State Management',
        home: HomeScreen(),
      ),
    );
  }
}

// HomeScreen Widget
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
        title: const Text('Flutter State Management'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(5),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_one_outlined),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('setState Example'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SetStateExample()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_two_outlined),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Provider Example'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProviderExample()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_3_outlined),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('Bloc Example'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlocExample()),
                );
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.looks_4_outlined),
              trailing: const Icon(Icons.arrow_forward_ios),
              title: const Text('GetX Example'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GetXExample()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
