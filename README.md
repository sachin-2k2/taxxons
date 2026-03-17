# Taxxons

A Flutter-based VAT management application for tracking purchases, sales, and tax payables.

## Test Credentials

| Field    | Value            |
|----------|------------------|
| Username | sachin@gmail.com |
| Password | S1*s2s3s4        |

## Features

- Firebase Authentication
- VAT Summary Dashboard (Input VAT, Output VAT, VAT Payable)
- Transaction history with tax breakdown
- Responsive design for all screen sizes
- Custom splash screen

## Getting Started

```bash
flutter pub get
flutter run
```

## Project Structure

```
lib/
├── core/
│   ├── routing/        # GoRouter navigation & splash delay
│   └── theme/          # AppColors & AppTheme
└── features/
    ├── auth/
    │   ├── data/        # Firebase & mock repositories
    │   ├── domain/      # Models & repository interfaces
    │   └── presentation/
    │       ├── providers/
    │       └── screens/ # Splash, Login
    └── home/
        └── presentation/
            ├── screens/ # HomeScreen
            └── widgets/ # HomeHeader, QuarterSelector,
                         # VatSummaryCard, TransactionItem,
                         # HomeBottomBar
```

## Dependencies

| Package            | Purpose              |
|--------------------|----------------------|
| `flutter_riverpod` | State management     |
| `go_router`        | Navigation           |
| `firebase_core`    | Firebase init        |
| `firebase_auth`    | Authentication       |
| `google_fonts`     | Typography (Inter)   |
