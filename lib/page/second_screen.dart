// lib/page/second_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_flutter/model/app_state.dart';
import 'package:suitmedia_flutter/page/third_screen.dart';
import 'package:suitmedia_flutter/widgets/custom_elevated_button.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();

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
              'Name: ${appState.name}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Selected User Name: ${appState.selectedUserName ?? 'None'}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 40),
            Center(
              child: CustomElevatedButton(
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ThirdScreen()),
                  );
                  if (result != null) {
                    context.read<AppState>().setSelectedUserName(result);
                  }
                },
                text: 'Choose a User',
                width: 250,
                borderRadius: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
