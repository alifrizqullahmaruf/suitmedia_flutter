import 'package:flutter/material.dart';
import 'package:suitmedia_flutter/page/second_screen.dart';
import 'package:suitmedia_flutter/widgets/custom_elevated_button.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController palindromeController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    palindromeController.dispose();
    super.dispose();
  }

  bool isPalindrome(String text) {
    String reversedText = text.split('').reversed.join('');
    return text == reversedText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.blue,
                Colors.green,
              ],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  // Image with rounded corners circle
                  ClipOval(
                    child: Image.network(
                      'https://i.pinimg.com/236x/7a/87/f7/7a87f754fc4d20a85e19410ee598f321.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),

                  SizedBox(height: 20),

                  // TextField name with border radius 16
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        labelText: 'Name',
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // TextField palindrome with border radius 16
                  SizedBox(
                    width: 250,
                    child: TextField(
                      controller: palindromeController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        labelText: 'Palindrome',
                      ),
                    ),
                  ),

                  SizedBox(height: 100),

                  CustomElevatedButton(
                    onPressed: () {
                      String text = palindromeController.text;
                      bool result = isPalindrome(text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(result
                              ? 'The text is Palindrome'
                              : 'The text is Not a palindrome'),
                        ),
                      );
                    },
                    text: 'Check',
                  ),

                  SizedBox(height: 20),

                  // Reusable Button next to the "SecondScreen" class with infinite border radius
                  CustomElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SecondScreen(name: nameController.text),
                        ),
                      );
                    },
                    text: 'Next',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
