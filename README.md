# Flutter News App (Clean Architecture)

A Flutter news application built using Clean Architecture, BLoC for state management, and Dio for network requests.

## Features

- Clean Architecture structure
- State management using BLoC (Business Logic Component)
- Dependency Injection using GetIt
- Network requests handled by Dio
- Displays news articles from newsapi.org
- Open Articles in browser
- Supports multiple countries and categories

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Free Api Key [NewsApi](https://newsapi.org/register)

### Installation

1. **Clone the repository:**

```plaintext
    git clone https://github.com/yourusername/flutter_news_app.git
    cd flutter_news_app
    update api key in lib/constants/constants.dart
```
 

2. **Install dependencies:**
    
```plaintext
    flutter pub get
```


3. **Run the app:**

```plaintext
    flutter run
```


## Project Structure

This project follows the principles of Clean Architecture.

```plaintext
lib
├── core
│   ├── resources
│   │   ├── data_state.dart
│   │   └── api_service.dart
│   ├── constants
│   │   └── constants.dart
│   └── util
│       └── responsive_utils.dart
├── features
│   └── daily_news
│       ├── data
│       │   ├── models
│       │   ├── repositories
│       │   └── data_sources
│       ├── domain
│       │   ├── entities
│       │   ├── repository
│       │   └── usecases
│       └── presentation
│           ├── blocs
│           ├── pages
│           └── widgets
├── injection_container.dart
└── main.dart
