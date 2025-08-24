# Flutter Shopping App

![App Screenshot](assets/screenshot.png)  

## Project Overview
A **complete shopping application** built with Flutter and Dart.  
This project simulates a real-world shopping experience, guiding developers from **Dart fundamentals** to a **fully functional mobile app** with authentication, product browsing, cart management, and localization.


## Features

### User Interface
- **Welcome Screen** with a visually appealing layout including:
  - App logo and two images (local & online)
  - Custom fonts (`Suwannaphum-Regular`)
  - Centered layout with proper spacing
  - Sign-Up and Sign-In buttons
- **Smooth Animations** for page transitions to enhance user experience

### Authentication
- **Sign-Up Form**
  - Full Name (first letter uppercase)
  - Email (must include `@`)
  - Password (minimum 6 characters)
  - Confirm Password (must match password)
  - Displays success dialog: "Account created successfully"
- **Sign-In Form**
  - Email & Password validation
  - Displays success dialog: "Account sign-in successfully"

### Shopping Home Screen
- **AppBar** titled "Our Products" (or "منتجاتنا" in Arabic)
- **PageView** to display featured products horizontally
- **GridView** showing product cards (2 per row) with:
  - Product image
  - Product title
  - Add to Cart button with SnackBar notification
- **Hot Offers Section** using `ListView.builder` with:
  - 5 vertically scrollable offers
  - Image and description for each item

### Localization
- Full support for **Arabic** language
- All UI text is externalized using `.arb` files and `intl` package
- Example translations:
  - "Our Products" → "منتجاتنا"
  - "Hot Offers" → "العروض الساخنة"
  - Sign-Up/Sign-In labels and messages fully translated

### Additional Features
- Input validation for email format and password requirements
- Modular Flutter widgets for clean and maintainable code
- Followed best practices for Flutter app architecture

## Setup Instructions

### Prerequisites
- **Flutter SDK** installed
- **Dart** installed
- IDE: **VS Code** or **Android Studio**
- Command-line tools for Flutter (`flutter doctor`)

### Steps to Run the Project
1. **Clone the repository**
```bash
git clone https://github.com/nadazweta/ShopCraft.git
```
2. **Navigate to the project folder**
```bash
cd flutter-shopping-app
```
3. **Install dependencies**
```bash
flutter pub get
```
4. **Run the application**
```bash
flutter run
```
5. **Localization**
```bash
The app automatically detects device language settings

To test Arabic manually, change device language or configure locale in app settings
```

## Project Structure

```bash
lib/
├── main.dart
├── screens/
├── widgets/
└── models/
```

## Technologies Used

### Flutter & Dart – Core app development
### GitHub – Repository hosting & version control
### VS Code / Android Studio – Development environment
### Flutter Intl – App localization
### Email Validator – Email input validation

## Contribution

### Contributions are welcome! Please fork the repository and create a pull request with your improvements.

**Enjoy your shopping app experience!**