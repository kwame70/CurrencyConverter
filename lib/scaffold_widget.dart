import 'package:currency_converter/components/my_textfield.dart';
import 'package:flutter/material.dart';

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  double results = 0;
  final TextEditingController amountController = TextEditingController();
  final TextEditingController rateController = TextEditingController();

  void cal() {
    results =
        double.parse(amountController.text) * double.parse(rateController.text);
    amountController.clear();
    rateController.clear();
  }

  @override
  void dispose() {
    amountController.dispose();
    rateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currency Converter"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(35, 45, 63, 6),
        elevation: 0,
      ),
      backgroundColor: const Color.fromRGBO(35, 45, 63, 6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              results != 0
                  ? results.toStringAsFixed(2)
                  : results.toStringAsFixed(0),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50),
            ),
            MyTextField(
              controller: amountController,
              hintText: "Enter amount",
            ),
            const SizedBox(
              height: 10.0,
            ),
            MyTextField(
              controller: rateController,
              hintText: "Enter rate",
            ),
            const SizedBox(
              height: 30.0,
            ),
            ElevatedButton(
              style: ButtonStyle(
                elevation: const MaterialStatePropertyAll(6),
                backgroundColor: const MaterialStatePropertyAll(Colors.black),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              onPressed: () {
                setState(() {
                  cal();
                });
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Convert",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
