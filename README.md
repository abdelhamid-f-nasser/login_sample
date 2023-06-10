# Login Application

A simple login feature in Flutter using Sqlflite, BLoC, Get_it, and Equatable.

## Getting Started

This project demonstrates the creation of a simple login feature in Flutter, utilizing the packages mentioned below. This will store the user credentials locally using Sqlflite, BLoC manages the state interactions, Get_it for dependency injection, and Equatable to simplify equality comparisons.

### Prerequisites

You will need to have Flutter SDK and Dart installed on your machine to run this project. Moreover, an emulator/device for running the app.

### Installation

First, clone the repository to your local machine.

```bash
git clone https://github.com/abdelhamid-f-nasser/login_sample.git
```

Then, navigate to the project folder and install the dependencies by running:

```bash
flutter pub get
```

### Build and Launch

To build and launch the app in an emulator:

```bash
flutter run
```

## Packages Used

```yaml
dependencies:

  # Dependency Injection service locator
  get_it: ^7.6.0

  # sql database for flutter
  sqflite: ^2.2.8+4

  # bloc state management for separation from user interface
  flutter_bloc: ^8.1.3

  # equatable is used to simplify equality comparisons
  equatable: ^2.0.5

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.0

  # Build Runner is a package that provides a concrete way of generating files using Dart code, outside of tools like pub and the Dart VM.
  build_runner: ^2.4.5
```

## Architecture

`UI` -> `Cubit` -> `DataSource` -> `Database Client`

- Presentation Layer: Handles the UI & user input, dispatches any events by making use of the Flutter_bloc package.
	- Contains Business logic component that receives the events and then retrieves & stores data, reading and writing to the DataSource.
- DataSource: Contains the CRUD functionality of the Sqlflite database, ensuring all related operations execute in a controlled manner.
- Database Client: Utilizes Get_it for dependency injection and managing instances of different classes, making it easy to access and manage various dependencies.

## Authors

- **Abdelhamid Nasser** - [Github Profile](https://github.com/abdelhamid-f-nasser)
