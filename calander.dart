import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calander(),
    ),
  );
}
class Calander extends StatefulWidget {
  const Calander({super.key});

  @override
  State<Calander> createState() => _CalanderState();
}

class _CalanderState extends State<Calander> {
  DateTime? date;
  Future<void> pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: date ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101)
    );
    if (!mounted || picked == null) return;
    setState(() {
      date = picked;
    });
  }
  void setDateValue() {
    setState(() {
      date = DateTime(2024, 1, 1); // Set the date to January 1, 2024
    });
  }
  @override
  Widget build(BuildContext context) {
    final text = date == null ? "no date selected":"${date!.day} / ${date!.month} / ${date!.year}";
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: pickDate,
              child: const Text("Pick a date"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: setDateValue,
              child: const Text("Set date to January 1, 2024"),
            ),
          ],
        ),
      )
    );
  }
}