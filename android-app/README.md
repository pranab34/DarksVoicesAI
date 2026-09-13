# Darks Voices AI — Native Android

Native Kotlin/Jetpack Compose migration of the supplied web application. The original web project is kept outside this folder and is not modified.

## Backend configuration
The web app keeps the Gemini credential server-side. The Android app therefore calls the same backend endpoints (`/api/optimize-text`, `/api/tts`, `/api/convert-to-mp3`) using `BuildConfig.API_BASE_URL` rather than embedding a Gemini key.

Set `API_BASE_URL` in `app/build.gradle.kts` to the deployed backend URL before release/building for real generation. If left empty, the UI remains usable but network generation reports that the backend is not configured.

For a CI build, pass `-PAPI_BASE_URL=https://your-deployed-backend.example.com` (or set the property in `gradle.properties`). Do not put a Gemini API key in the APK.
