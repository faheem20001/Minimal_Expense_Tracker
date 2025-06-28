Expense Tracker App
A modern and intuitive expense tracker application built with Flutter, featuring offline data persistence, interactive charts, and Material 3 UI.

Features
Material 3 UI: Clean and modern interface with dynamic theming.

Dark/Light Mode: Toggle between light and dark themes for comfortable viewing.

Offline Data Persistence: Built-in SQLite database keeps your data safe and accessible anytime.

Add, View, and Delete Expenses: Manage your expenses with ease.

Expense Categories: Organize expenses by category (Food, Travel, Shopping, Bills, etc.).

Interactive Charts: Visualize your spending patterns with pie and bar charts.

Responsive Design: Works smoothly on both Android and iOS devices.

Screenshots
![Screenshot_20250628_205046](https://github.com/user-attachments/assets/bce521c1-6ad5-41f5-930e-9dee5e975898)
![Screenshot_20250628_205000](https://github.com/user-attachments/assets/d35b5253-17f1-4609-8242-03a7285e3a1c)
![Screenshot_20250628_204940](https://github.com/user-attachments/assets/4e38ed54-b759-4e0d-a0e6-fe38096b4e5c)
![Screenshot_20250628_204830](https://github.com/user-attachments/assets/ca086e89-673e-4d43-995e-1b82c141be9b)



Getting Started
Prerequisites
Flutter SDK (latest stable version recommended)

Android Studio or VS Code

Git (for version control)

Installation
Clone the repository:

bash
git clone https://github.com/yourusername/expense-tracker-flutter.git
Navigate to the project directory:

bash
cd expense-tracker-flutter
Install dependencies:

bash
flutter pub get
Run the app:

bash
flutter run
Project Structure
lib/: Main application code

screens/: App screens (Home, Add Expense)

widgets/: Reusable UI components (Charts, etc.)

providers/: State management (ExpenseProvider, ThemeProvider)

models/: Data models (Expense)

database/: Database helper for SQLite

android/ & ios/: Platform-specific configuration

Technologies Used
Flutter – UI toolkit for building natively compiled apps

SQLite – Local database for offline storage

Provider – State management

fl_chart – Interactive charts for data visualization

intl – Date and time formatting
