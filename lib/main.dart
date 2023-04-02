import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void increment() {
    if (count < 20) {
      setState(() {
        count++;
      });
      print(count);
    } else {
      print('Lotação maxima');
    }
  }

  void decrement() {
    if (count > 0) {
      setState(() {
        count--;
      });
      print(count);
    } else {
      print('Vazio');
    }
  }

  bool get isEmpty => count == 0;

  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/restaurante.jpg'),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar',
              style: TextStyle(
                fontSize: 40,
                color: isFull ? Colors.red.shade900 : Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 100,
                color: isFull ? Colors.red.shade900 : Colors.black,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.5) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32,
                ),
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.5) : Colors.white,
                    fixedSize: const Size(100, 100),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
