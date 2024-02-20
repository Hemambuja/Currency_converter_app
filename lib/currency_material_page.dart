import 'package:flutter/material.dart';

class CurrencyMaterialPage extends StatefulWidget {
  const CurrencyMaterialPage({super.key});

  @override
  State<CurrencyMaterialPage> createState() =>
      _CurrencyConverterMaterialPageState();
}

class _CurrencyConverterMaterialPageState extends State<CurrencyMaterialPage> {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  void convert() {
    result = double.parse(textEditingController.text) * 80;
    setState(() {});
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 24, 9, 40),
        width: 50,
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 40, 45),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 6, 40, 45),
        title: const Text(
          'Currency Converter',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.amberAccent,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'INR ${result != 0 ? result.toStringAsFixed(3) : result.toStringAsFixed(0)}',
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                controller: textEditingController,
                style: const TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 26,
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                  hintText: "Please enter amount in USD",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 121, 118, 125),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.monetization_on,
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  focusedBorder: border,
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: convert,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.amber,
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    ' convert',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
