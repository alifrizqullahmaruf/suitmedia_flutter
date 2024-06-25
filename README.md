# suitmedia_flutter

A new Flutter project.

## Introduction

Suitmedia Flutter is a mobile application built using the Flutter framework. The application consists of three main screens and demonstrates basic functionalities such as navigating between screens, state management using the Provider package, and fetching data from an API. The primary purpose of this application is to serve as a starting point for learning and understanding Flutter development concepts.

## Features

1. **First Screen**: 
   - Allows the user to input their name and a text to check if it is a palindrome.
   - Provides feedback on whether the entered text is a palindrome.
   - Navigation to the Second Screen with the entered name.

2. **Second Screen**:
   - Displays a welcome message along with the entered name.
   - Allows navigation to the Third Screen to select a user from a list.

3. **Third Screen**:
   - Fetches and displays a list of users from an API.
   - Allows the selection of a user, which updates the state in the Second Screen.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Project Structure

### main.dart

The entry point of the application. It sets up the `MyApp` widget and initializes the `AppState` using the Provider package.

```dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmedia_flutter/model/app_state.dart';
import 'package:suitmedia_flutter/page/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const FirstScreen(),
      ),
    );
  }
}
