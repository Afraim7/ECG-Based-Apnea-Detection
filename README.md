# Apnoxia

A Flutter-based mobile application for detecting sleep apnea using ECG signals.

## 🩺 About the Project

Apnoxia allows users to upload ECG recordings and receive a segment-by-segment apnea diagnosis. The app integrates with a Flask backend that hosts a trained deep learning model for accurate classification. It uses Cubit for efficient and scalable state management.

### ⚙️ Key Features

- Upload and analyze ECG signals.
- Deep learning model integration via Flask API.
- Binary and multi-class apnea detection.
- Segment-level results (1-minute epochs).
- Clean and responsive UI with state management using Cubit.

## 🚀 Getting Started

To run this app locally:

```bash
flutter pub get
flutter run
