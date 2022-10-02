import 'package:counter_with_getx/controllers/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterController = Get.put(CounterController());
    return Obx(
      () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: counterController.isDark.value
            ? ThemeData.dark()
            : ThemeData.light(),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('Di rebuild Ulang');
    final counterC = Get.find<CounterController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar GetX'),
        centerTitle: true,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              '${counterC.number}',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.green,
                child: IconButton(
                  onPressed: () {
                    counterC.increment();
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
              Container(
                color: Colors.grey,
                child: IconButton(
                  onPressed: () {
                    counterC.decrement();
                  },
                  icon: const Icon(Icons.remove),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterC.changeTheme(),
        child: const Icon(Icons.dark_mode),
      ),
    );
  }
}
