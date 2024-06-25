# suitmedia_flutter

A new Flutter project.

## Introduction

![Suitmedia Flutter](https://drive.google.com/uc?export=view&id=11aE-f6toC626Mny1gjd1AcJdOHBaaQUk)

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

- `main.dart`: The entry point of the application. It sets up the `MyApp` widget and initializes the `AppState` using the Provider package.
- `custom_elevated_button.dart`: A custom widget for an elevated button with configurable properties.
- `app_state.dart`: Manages the state of the application, including the user's name and the selected user's name. Also contains a method to check if a text is a palindrome.
- `first_screen.dart`: The first screen of the application, where the user can input their name and check if a text is a palindrome.
- `second_screen.dart`: The second screen of the application, displaying the user's name and allowing navigation to the Third Screen.
- `third_screen.dart`: The third screen of the application, fetching and displaying a list of users from an API.

## How to Run

To run the application, ensure you have Flutter installed and set up. Then, follow these steps:

1. Clone the repository.
2. Navigate to the project directory.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run` to start the application.

## Conclusion

This application serves as a practical introduction to Flutter development, showcasing essential concepts such as state management, custom widgets, and API integration. Feel free to explore and modify the code to better understand how Flutter applications are built.
