importScripts('https://www.gstatic.com/firebasejs/10.10.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/10.10.0/firebase-messaging-compat.js');

try {
  // Initialize Firebase
  firebase.initializeApp({
    apiKey: 'AIzaSyCY7AiUHJf1TExbFrHrqYbnS_3NFppiDjo',
    appId: '1:163590713345:web:b63167925dd49a63811000',
    messagingSenderId: '163590713345',
    projectId: 'chat-app-1b26a',
    authDomain: 'chat-app-1b26a.firebaseapp.com',
    storageBucket: 'chat-app-1b26a.firebasestorage.app',
  });

  const messaging = firebase.messaging();

messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});
