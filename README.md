# Couple App

This repository contains a simple boilerplate for a couples management application.
The backend is built with **Django** and uses a local SQLite database. The frontend
is a basic **Flutter** project which can be compiled for iOS or Android. Docker
files are provided to run both parts together for development.

## Local Setup

### Backend
1. Ensure you have **Python 3.11+** installed.
2. Create a virtual environment and install dependencies:
   ```bash
   python -m venv venv
   source venv/bin/activate
   pip install -r backend/requirements.txt
   ```
3. Run database migrations and start the server:
   ```bash
   cd backend
   python manage.py migrate
   python manage.py runserver
   ```
   The API will be available at `http://localhost:8000/`.

### Frontend
1. Install the **Flutter SDK** following the instructions at [flutter.dev](https://flutter.dev).
2. Fetch dependencies and run the application:
   ```bash
   cd frontend
   flutter pub get
   flutter run
   ```
   By default this will launch the app on your connected device or emulator.

## Running with Docker

Docker images for the backend and frontend are defined in `docker-compose.yml`.
When you start the containers the necessary Python and Flutter dependencies will
be installed automatically.
To build and start both services run:

```bash
docker-compose up --build
```

The backend will listen on port **8000** and the Flutter web build will be served
on port **8080**.
You can open [http://localhost:8080](http://localhost:8080) in your browser to see a live preview of the
Flutter application.

---

This project only provides a minimal skeleton. You can expand the Django project
with apps and models that implement the features outlined in the project spec and
develop the Flutter interface for iOS and Android as needed.
