# task

# Task Manager App (Flutter + Clean Architecture + BLoC)

A simple task manager app built with Flutter. Users can add, view, and delete tasks. The app is built using Clean Architecture principles and follows best practices in Object-Oriented Programming (OOP) and SOLID design principles.

---

## Features

- Display list of tasks
- Add new tasks with a title and optional description
- Delete tasks
- Local in-memory storage (no API/backend)
- Clean separation of layers
- BLoC state management
- Dependency Injection with `get_it`

---

## Project Structure (Clean Architecture)

lib/
│
├── core/                # helpers, constants
│
├── data/                # Data source layer
│   └── repositories/
│       └── task_repository_impl.dart
│
├── domain/              # Business logic layer
│   ├── entities/
│   │   └── task.dart
│   ├── repositories/
│   │   └── task_repository.dart
│   └── usecases/
│       ├── add_task.dart
│       ├── delete_task.dart
│       └── get_all_tasks.dart
│
├── presentation/        # UI layer
│   ├── bloc/
│   │   ├── task_bloc.dart
│   │   ├── task_event.dart
│   │   └── task_state.dart
│   ├── screens/
│   │   └── task_list/
│   │       ├── task_list_screen.dart
│   │       └── add_task_bottom_sheet.dart
│   └── widgets/
│       └── task_item.dart
│
├── shared/              # Shared UI like styles/widgets
│   ├── widgets/
│   │   └── custom_button.dart
│   └── styles/
│       └── app_colors.dart
│
├── di/
│   └── injection.dart   # Dependency Injection setup
│
└── main.dart            # App entry point


---

## Object-Oriented Programming (OOP) in Practice

**Encapsulation**
- Each layer encapsulates its responsibility.
- Classes like `Task`, `TaskBloc`, `TaskRepository` have private logic and expose only what's needed.
- Form logic (validation, controllers) is kept inside the screen widget.

**Inheritance & Polymorphism & Abstraction**
- `TaskRepository` is an abstract class in the domain layer.
- The implementation `TaskRepositoryImpl` in the data layer overrides its methods.
- This makes it easy to swap data sources (e.g., later with API or DB).

---

## SOLID Principles in Practice

### **S – Single Responsibility**
- Each class has only one job:
    - `TaskBloc` manages state.
    - `TaskRepositoryImpl` handles data storage.
    - `AddTask` use case adds a task.

### **O – Open/Closed Principle**
- Adding new types of tasks or storage doesn’t require editing existing logic.
- You can extend use cases or replace the repository without touching core logic.

### **L – Liskov Substitution**
- `TaskRepositoryImpl` can replace `TaskRepository` anywhere because it implements the full contract.

### **I – Interface Segregation**
- The abstract `TaskRepository` interface only exposes relevant methods like `add`, `delete`, and `getAll`.

### **D – Dependency Inversion**
- High-level classes like `TaskBloc` and use cases depend on abstractions (`TaskRepository`), not implementations.
- Implementations are injected using `get_it`.

---

## State Management

- The app uses **BLoC** for state management.
- Events like `AddNewTask` or `DeleteTask` are handled in `TaskBloc`, which emits new states accordingly.
- The UI listens for state changes and updates automatically.

---

## Dependency Injection

- Dependencies like `TaskRepositoryImpl`, `TaskBloc`, and UseCases are injected using `get_it` in `injection.dart`.
- This improves testability and decouples implementation from usage.

---

## How to Run

```bash
flutter pub get
flutter run

Built by [Mostafa Kamal]