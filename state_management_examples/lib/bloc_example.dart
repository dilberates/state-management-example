import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitSelectionBloc extends BlocBase<List<String>> {
  FruitSelectionBloc() : super([]);

  void toggleFruit(String fruit) {
    List<String> currentSelection = state;
    if (currentSelection.contains(fruit)) {
      currentSelection.remove(fruit); // Seçili ise listeden çıkar
    } else {
      currentSelection.add(fruit); // Seçili değilse listeye ekle
    }
    emit(List.from(
        currentSelection)); // State'i güncelle (Yeni bir liste oluşturarak referansı değiştir)
  }
}

class BlocExample extends StatelessWidget {
  final List<String> fruits = [
    'Apple',
    'Banana',
    'Orange',
    'Grapes',
    'Watermelon'
  ];

  BlocExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Example'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
      ),
      body: Center(
        child: Column(
          children: fruits.map((fruit) {
            return BlocBuilder<FruitSelectionBloc, List<String>>(
              builder: (context, selectedFruits) {
                return Column(
                  children: [
                    CheckboxListTile(
                      title: Text(fruit),
                      value: selectedFruits.contains(fruit),
                      // Meyve seçili mi kontrol et
                      onChanged: (isChecked) {
                        final fruitBloc = context.read<FruitSelectionBloc>();
                        fruitBloc
                            .toggleFruit(fruit); // Meyve seçimini toggle et
                      },
                    ),
                    if (selectedFruits
                        .contains(fruit)) // Seçili olan meyveleri göster
                      Text(
                        '$fruit selected',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                  ],
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
