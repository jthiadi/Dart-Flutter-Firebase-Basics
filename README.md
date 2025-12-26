# Dart-Flutter-Firebase-Basics
This repository contains a collection of mobile application projects developed using Flutter and Dart. Each project focuses on specific aspects of mobile engineering, ranging from fundamental UI layouts to advanced animations and cloud backend integration.

These are the lab projects completed in the **Software Studio course (Year 113)** under **Professor Wu Shan-Hung**.

📌 **Final Result:**  **100 / 100** for all labs.


## 1️⃣ Dice Rolling App
A simple dice-rolling game where the user gets 5 rolls to reach or exceed a target score.

### 📌 Key Features
- Display each dice result (or “--” before rolling)
- Track and show remaining chances
- Show the current total score
- Display a progress bar toward the target
- At the end of a round:
  - Show a **win** message if the target score is reached
  - Show a **lose** message otherwise
- Allow restarting the game

### 🛠 Skills Practiced
- Stateful widgets
- Updating UI based on internal state
- Basic layout design
- Conditional UI rendering

---

## 2️⃣ Quiz App
A multiple-choice quiz app where the user answers questions and sees results.

### 📌 Key Work
- Fix runtime and logic bugs in the app
- Improve the results screen UI so it clearly shows:
  - Which answers were correct
  - Which ones were wrong
  - What the user selected

### 🛠 Skills Practiced
- Reading and understanding existing code
- Identifying and fixing bugs
- Improving UI usability and readability
- Managing app state across screens

---

## 3️⃣ Expense Tracker App
An expense-tracking app where users enter spending records and see visual summaries.

### 📌 Key Features Added
- A bar chart showing how much was spent in each category
- Form input validation displaying field-specific error messages
- Custom app themes (light + dark mode)

### 🛠 Skills Practiced
- Chart UI building
- Error handling in forms
- Input validation
- Theming & material design
- Structuring Flutter widgets cleanly

---

## 4️⃣ AI-Powered Recipe App (Firebase + Genkit)
A recipe recommendation app powered by AI flows deployed on Firebase functions.

### 📌 Core Flow Logic
1. Retrieve relevant recipes based on ingredients entered by the user  
2. Generate a customized recipe (and optional images) using AI

### 🛠 Skills Practiced
- Writing & deploying Firebase Cloud Functions
- Structuring AI flows
- Using schema-based APIs
- Connecting Flutter with backend endpoints
- Handling asynchronous data

---

## 5️⃣ Expense App Tutorial with Parallax Scrolling
A two-page interactive tutorial screen inside the expense app.

### 📌 Key Features
- Button on the app bar to open the tutorial
- Swipe between tutorial pages
- Parallax scrolling effect:
  - Text and buttons move at different speeds
- Buttons perform context-specific actions

### 🛠 Skills Practiced
- PageView navigation
- Animation & transforms
- UI motion design principles
- Controller listeners & scroll logic

---

## 6️⃣ Meals App with Proxy Provider
An optimized version of the Meals app where filtered meal data is handled by a provider rather than recalculated repeatedly.

### 📌 Key Concepts
- Store filtered meal data in a shared state object
- Automatically update filtered meals when filters change
- Avoid unnecessary rebuilds

### 🛠 Skills Practiced
- Provider & ChangeNotifier patterns
- ProxyProvider usage
- Clean separation of UI & logic
- Reducing computational overhead

---

## 7️⃣ Meals App with Staggered Animations
A staggered animation effect where different rows of meal categories slide in sequentially.

### 📌 Key Concepts
- Animating groups of widgets
- Delaying motion between rows
- Controlling animation curves & timing
- Triggering animations on build/navigation

### 🛠 Skills Practiced
- AnimationController
- Tween and Interval usage
- Animation sequencing
- Performance-friendly animation design

---

## 8️⃣ Group Todo List App
A todo application where users can be created, assigned tasks, and deleted safely.

### 📌 Key Features
- Delete a user from the app
- Confirm deletion with a dialog
- Reassign existing todos from deleted users to others
- Handle cases where no users remain
- Implement backend logic safely using Cloud Functions

### 🛠 Skills Practiced
- Firestore operations
- Transaction-safe logic
- Preventing orphaned data
- Cloud function deployment
- Edge-case handling

---

## 9️⃣ Group Chat App with Push Notifications
A group chat app that supports push notifications across platforms.

### 📌 Key Concepts
- Firebase messaging setup
- Cloud function triggers
- Web notification service worker
- Mobile notification behavior

### 🛠 Skills Practiced
- Realtime chat architecture
- Messaging pipelines
- Platform-specific configuration
- Firebase deployment workflow

---
