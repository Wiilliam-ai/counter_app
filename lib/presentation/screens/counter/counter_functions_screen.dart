import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  int clickCounter = 0;

  @override
  Widget build(BuildContext context) {
    String textFinal = clickCounter == 1 ? 'Click' : 'Clicks';

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Counter Functions Screen',
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.refresh_rounded),
              onPressed: () {
                setState(() {
                  clickCounter = 0;
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$clickCounter',
                style:
                    const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              Text(
                textFinal,
              )
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          spacing: 15,
          children: [
            CustomButton(
              icon: Icons.refresh_rounded,
              onPressed: () => {
                setState(() {
                  clickCounter = 0;
                })
              },
            ),
            CustomButton(
              icon: Icons.plus_one,
              onPressed: () => {
                setState(() {
                  clickCounter++;
                })
              },
            ),
            CustomButton(
              icon: Icons.exposure_minus_1_outlined,
              onPressed: () {
                if (clickCounter == 0) return;
                setState(() {
                  clickCounter--;
                });
              },
            )
          ],
        ));
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const StadiumBorder(),
      backgroundColor: Colors.deepOrangeAccent,
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
