# Harry Potter – Pracownicy
Aplikacja Flutter wyświetlająca listę nauczycieli z uniwersum Harry’ego Pottera.  
Użytkownik może przeglądać pracowników, filtrować ich za pomocą wyszukiwarki, przejść do ekranu szczegółów wybranego nauczyciela oraz sprawdzić ranking polubień.  
Dodatkowo istnieje ekran domu Hogwartu z listą znanych uczniów z API.

## Funkcjonalności
- Wyświetlanie listy nauczycieli (REST API)
- Wyszukiwarka filtrująca wyniki
- Ekran szczegółów nauczyciela
- Polubienia (ranking)
- Drugi endpoint REST: lista uczniów danego domu
- Obsługa błędów i stanów ładowania
- Działanie offline dzięki lokalnej pamięci (SharedPreferences)
- Oddzielona logika (ViewModel) od widoków (Widgety)

## Użyte API
Projekt korzysta z otwartego API HP:  
https://hp-api.onrender.com

Wykorzystywane endpointy:
- `/api/characters/staff` – lista pracowników szkoły
- `/api/character/{name}` – dane szczegółowe
- `/api/characters/house/{house}` – lista osób z domu

## Instrukcja uruchomienia projektu
Aby uruchomić aplikację lokalnie, wykonaj poniższe kroki w terminalu (np. w Android Studio lub VS Code):
1. Pobranie zależności projektu
W katalogu projektu uruchom: flutter pub get
Polecenie to pobierze wszystkie niezbędne paczki opisane w pliku pubspec.yaml.
2. Uruchomienie aplikacji
Po zainstalowaniu zależności możesz wystartować projekt poleceniem: flutter run
Aplikacja zostanie uruchomiona na podłączonym emulatorze lub urządzeniu mobilnym.

## Aplikacja wspiera platformy:
- Android 
- Web
## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
