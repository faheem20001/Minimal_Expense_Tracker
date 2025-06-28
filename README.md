

# Expense Tracker App

A modern, intuitive expense tracking application built with Flutter, featuring offline data persistence, interactive charts, and Material 3 UI.

## Features

- **Material 3 UI:** Clean and modern interface with dynamic theming.
- **Dark/Light Mode:** Seamlessly toggle between light and dark themes for comfortable viewing.
- **Offline Data Persistence:** Built-in SQLite database keeps your data safe and accessible anytime.
- **Add, View, and Delete Expenses:** Easily manage your expenses.
- **Expense Categories:** Organize expenses by category (Food, Travel, Shopping, Bills, etc.).
- **Interactive Charts:** Visualize your spending patterns with pie and bar charts.
- **Responsive Design:** Works smoothly on both Android and iOS devices.


## Getting Started

### Prerequisites

- **Flutter SDK** (latest stable version recommended)
- **Android Studio** or **VS Code**
- **Git** (for version control)

### Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/expense-tracker-flutter.git
   ```
2. **Navigate to the project directory:**
   ```bash
   cd expense-tracker-flutter
   ```
3. **Install dependencies:**
   ```bash
   flutter pub get
   ```
4. **Run the app:**
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── screens/         # App screens (Home, Add Expense)
├── widgets/         # Reusable UI components (Charts, etc.)
├── providers/       # State management (ExpenseProvider, ThemeProvider)
├── models/          # Data models (Expense)
├── database/        # Database helper for SQLite
android/             # Android-specific configuration
ios/                 # iOS-specific configuration
```

## Technologies Used

- **Flutter** – UI toolkit for building natively compiled apps
- **SQLite** – Local database for offline storage
- **Provider** – State management
- **fl_chart** – Interactive charts for data visualization
- **intl** – Date and time formatting



**Tip:**  
To make your README even more attractive, consider adding a short demo video or GIF and a license section if your project is open source.

*Feel free to copy and use this updated README.md for your project!*

[1] https://ppl-ai-file-upload.s3.amazonaws.com/web/direct-files/attachments/65772316/f974e6ed-f0fe-42c4-82ee-6ed1855b449d/README.md
