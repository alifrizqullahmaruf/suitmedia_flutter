import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/page/third_screen.dart';

class SecondScreen extends StatefulWidget {
  final String name;

  const SecondScreen({super.key, required this.name});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String? selectedUserName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Welcome',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Name: ${widget.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Selected User Name: ${selectedUserName ?? 'None'}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThirdScreen()),
                    );
                    if (result != null) {
                      setState(() {
                        selectedUserName = result;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text('Choose a User'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}