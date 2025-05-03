# 🦠 COVID-19 Tracker App

A Flutter application to track global and country-wise COVID-19 data using the MVVM architecture. This project was built to practice **API integration** and implement a clean and scalable structure using the **[https://disease.sh/v3/covid-19/](https://disease.sh/v3/covid-19/)** API.

## 📱 Features

* 🚀 **Animated Splash Screen** using `animated_text_kit`
* 🌍 **World Stats Screen** with real-time global COVID-19 data
* 🌐 **Country Stats List** with search functionality
* 🔍 **Country Detail Screen** displaying detailed COVID-19 data for each country
* 📊 **Pie Charts** for visual representation of data
* 💫 **Shimmer Effects** and **Spinners** for better UI/UX loading experience

## 🧠 Architecture

* Implemented using **MVVM (Model-View-ViewModel)** design pattern for clean and maintainable code structure.

## 📦 Packages Used

* [`http: ^1.3.0`](https://pub.dev/packages/http): For making HTTP requests to the API
* [`animated_text_kit: ^4.2.3`](https://pub.dev/packages/animated_text_kit): For animated splash screen text
* [`pie_chart: ^5.4.0`](https://pub.dev/packages/pie_chart): To show COVID stats visually
* [`flutter_spinkit: ^5.2.1`](https://pub.dev/packages/flutter_spinkit): Pre-built loading indicators
* [`shimmer: ^3.0.0`](https://pub.dev/packages/shimmer): For loading placeholders while data is fetched

## 📂 Project Structure

```
lib/
├── models/              # Data models
├── view/                # UI screens (SplashScreeh, WorldStats, CountryStats,DetailScreen etc.)
├── view_model/          # Business logic and API integration
├── services/            # API service layer
└── main.dart            # App entry point
```


## 📸 Screenshots

![Covud_19 UI-01](https://github.com/user-attachments/assets/3c08ad5d-9ec2-4162-8546-f907d6e032fc)
