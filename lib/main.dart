import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Variables for operations
  int sum = 0;
  int difference = 0;
  int product = 0;
  double quotient = 0.0;

  // Controllers for each operation
  TextEditingController sumFirstNumController = TextEditingController();
  TextEditingController sumSecondNumController = TextEditingController();
  TextEditingController diffFirstNumController = TextEditingController();
  TextEditingController diffSecondNumController = TextEditingController();
  TextEditingController prodFirstNumController = TextEditingController();
  TextEditingController prodSecondNumController = TextEditingController();
  TextEditingController divFirstNumController = TextEditingController();
  TextEditingController divSecondNumController = TextEditingController();

  //I separated all operations so that they can work individually.
  // Method to calculate sum
  void calculateSum() {
    setState(() {
      int sumNum1 = int.parse(sumFirstNumController.text);
      int sumNum2 = int.parse(sumSecondNumController.text);
      sum = sumNum1 + sumNum2;
    });
  }

  // Method to calculate difference
  void calculateDifference() {
    setState(() {
      int diffNum1 = int.parse(diffFirstNumController.text);
      int diffNum2 = int.parse(diffSecondNumController.text);
      difference = diffNum1 - diffNum2;
    });
  }

  // Method to calculate product
  void calculateProduct() {
    setState(() {
      int prodNum1 = int.parse(prodFirstNumController.text);
      int prodNum2 = int.parse(prodSecondNumController.text);
      product = prodNum1 * prodNum2;
    });
  }

  // Method to calculate quotient
  void calculateQuotient() {
    setState(() {
      int divNum1 = int.parse(divFirstNumController.text);
      int divNum2 = int.parse(divSecondNumController.text);
      quotient = divNum2 != 0 ? divNum1 / divNum2 : 0.0;
    });
  }

  // Method to clear input fields
  void clearFields() {
    setState(() {
      sumFirstNumController.clear();
      sumSecondNumController.clear();
      diffFirstNumController.clear();
      diffSecondNumController.clear();
      prodFirstNumController.clear();
      prodSecondNumController.clear();
      divFirstNumController.clear();
      divSecondNumController.clear();
      sum = 0;
      difference = 0;
      product = 0;
      quotient = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Add Row (Sum)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: sumFirstNumController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const Text(" + "),
                Expanded(
                  child: TextField(
                    controller: sumSecondNumController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                Text(' = $sum'),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: calculateSum,
                ),
              ],
            ),

            // Minus Row (Difference)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: diffFirstNumController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const Text(" - "),
                Expanded(
                  child: TextField(
                    controller: diffSecondNumController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                Text(' = $difference'),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: calculateDifference,
                ),
              ],
            ),

            // Multiplication Row (Product)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: prodFirstNumController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const Text(" * "),
                Expanded(
                  child: TextField(
                    controller: prodSecondNumController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                Text(' = $product'),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: calculateProduct,
                ),
              ],
            ),

            // Division Row (Quotient)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: divFirstNumController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                  ),
                ),
                const Text(" ÷ "),
                Expanded(
                  child: TextField(
                    controller: divSecondNumController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                  ),
                ),
                Text(' = ${quotient.toStringAsFixed(2)}'),
                IconButton(
                  icon: const Text('÷', style: TextStyle(fontSize: 25.0)),
                  onPressed: calculateQuotient,
                ),
              ],
            ),

            // Clear Button
            TextButton(
              onPressed: clearFields,
              child: const Text("Clear All"),
            ),
          ],
        ),
      ),
    );
  }
}
