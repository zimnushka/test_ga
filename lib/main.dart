import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => MainProvider(),
      child: Scaffold(
        body: Builder(builder: (context) {
          final stringList = context.select((MainProvider mainProvider) => mainProvider.mainList);
          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stringList.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    child: SizedBox(
                      width: 100,
                      child: Text(
                        stringList.elementAt(index),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              )),
              Expanded(
                  child: DecoratedBox(
                decoration: const BoxDecoration(color: Colors.grey, borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(30))),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(100, (index) => Text('$index, text loooooong ${index * index * index * index}')),
                  ),
                ),
              )),
            ],
          );
        }),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              onPressed: () {
                //TODO3 данная кнопка должна добавлять элементы в список
              },
              tooltip: 'Add',
              child: const Icon(Icons.add),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class MainProvider extends ChangeNotifier {
  List<String> mainList = [];
  void addStrings() {
    //TODO1 сделать, чтобы работало добавление
    mainList.addAll(List<String>.from(['1', '2', '3', '4', '5']));
    notifyListeners();
  }

  //TODO4
  //Дан массив данных размером N [13, 12, 15, 11, 9, 12, 16]
  //Это температура за каждый день
  //Нужно для каждого элемента массива найти колво дней до наступления более теплого дня
  //Очистить mainList и вывести вместо текстовых чисел пары чисел Температура - Количество днея до более теплого дня в виде Row.
}
