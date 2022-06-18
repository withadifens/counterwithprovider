import 'package:counterwithprovider/provider/counter_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      backgroundColor: counterProvider.isDark
          ? const Color.fromARGB(137, 36, 36, 36)
          : Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                'Theme',
                style: counterProvider.isDark
                    ? const TextStyle(color: Colors.white)
                    : const TextStyle(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Light',
                  style: counterProvider.isDark
                      ? const TextStyle(color: Colors.white)
                      : const TextStyle(),
                ),
                Switch(
                    activeColor: Colors.purple,
                    value: counterProvider.isDark,
                    onChanged: (newValue) {
                      counterProvider.changeTheme();
                      newValue = counterProvider.isDark;
                    }),
                Text(
                  'Dark',
                  style: counterProvider.isDark
                      ? const TextStyle(color: Colors.white)
                      : const TextStyle(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Numbers:',
                style: counterProvider.isDark
                    ? const TextStyle(color: Colors.white, fontSize: 18)
                    : const TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Text(
                counterProvider.value.toString(),
                style: counterProvider.isDark
                    ? const TextStyle(color: Colors.white, fontSize: 24)
                    : const TextStyle(fontSize: 24),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          counterProvider.isDark ? Colors.purple : Colors.black
                        ],
                      ),
                      borderRadius: BorderRadius.circular(18)),
                  child: IconButton(
                    onPressed: () {
                      counterProvider.incrementNumber();
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.deepPurple,
                          counterProvider.isDark ? Colors.purple : Colors.black
                        ],
                      ),
                      borderRadius: BorderRadius.circular(18)),
                  child: IconButton(
                    onPressed: () {
                      counterProvider.decrementNumber();
                    },
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          counterProvider.clearValue();
        },
        backgroundColor:
            counterProvider.isDark ? Colors.deepPurple : Colors.black,
        icon: const Icon(Icons.delete),
        label: const Text('clear'),
      ),
    );
  }
}
