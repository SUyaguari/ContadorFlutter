import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;
  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void restart() {
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextStyle fontSize = const TextStyle(fontSize: 25);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Homescreeen'),
          elevation: 5.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Numero de clicks:', style: fontSize),
              Text(
                '$counter',
                style: fontSize,
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFloatingActions(
          increaseFunction: increase,
          decreaseFunction: decrease,
          restartFunction: restart,
        ));
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFunction;
  final Function decreaseFunction;
  final Function restartFunction;

  const CustomFloatingActions({
    required this.increaseFunction,
    super.key,
    required this.decreaseFunction,
    required this.restartFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.remove),
          onPressed: () => decreaseFunction(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.restart_alt_rounded),
          onPressed: () => restartFunction(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => increaseFunction(),
        ),
      ],
    );
  }
}
