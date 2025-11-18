# 🌍 WorldTime
A modern Flutter app that displays the **current time across countries worldwide**, with smooth UI,  dynamic themes, and real-time updates.

---

## ✨ Features

- **Live ticking clock** (updates every second)
- **Automatic day/night theme** based on the selected country
- **80+ countries** with flag emojis
- **Search-enabled location picker**
- **Gradient-based UI** for a clean, modern look
- **Multiple screens** (Home, Choose Location, About)
- Makes use of **async/await** for API fetching
- Handles loading states and errors gracefully

---

## 🧠 How It Works

The app fetches accurate local time using a timezone API.
After the initial fetch:

- The app **does not re-call the API every second**
- Instead, it calculates the **elapsed time locally**, keeping the clock perfectly in sync
- This reduces API calls and keeps performance smooth

The background theme changes automatically depending on whether it's daytime or nighttime in the selected location.

---

## 📱 App Screens

### **Home Page**
- Displays time, date, and day/night indicator
- Gradient background changes based on time
- Transparent top bar
- “Change Location” button at the bottom

### **Choose Location**
- Large list of countries with flags
- Smooth, responsive search bar
- Loading animation when selecting a country
- Gradient header with an About button

### **About Page**
- Simple information about the app and its purpose

---

## 🛠️ Tech Stack

- **Flutter** (Dart)
- **IPGeolocation Timezone API**
- Uses built-in **async/await** pattern

---

## ❤️ Credits

- Built with op teachings of Karan bhaiya.