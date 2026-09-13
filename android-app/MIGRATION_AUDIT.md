# Darks Voices AI migration audit

## Detected identity
- Name: Darks Voices AI
- Purpose: studio-grade Bengali and Hindi AI voice-message generator using Gemini TTS, with male/female voices, pronunciation/script optimization, WAV + MP3 output, and 20-message local history.
- Web PWA metadata confirms the name and description.

## Screens / functional areas
The supplied web app is a single-page application. Its functional areas are:
1. Header: app identity, icon modal, PWA install guide, Bengali/English UI toggle.
2. Intro/banner explaining Bengali/Hindi voice generation.
3. Text editor: Bengali/Hindi tabs, preset messages, paste, clear, word/character count, pronunciation optimization.
4. Voice settings: male/female switch, three voices per gender, delivery tone, auto-optimization toggle.
5. Generation/error state: TTS request, rate-limit countdown and retry messaging.
6. Active audio player: playback, waveform/progress, speed/mute/replay controls, sharing and WAV/MP3 download controls.
7. History: most recent 20 generated messages, playback, update/delete/clear.
8. App icon modal: 192px/512px PNG and SVG download in the web app.

## External integration
- POST /api/optimize-text -> Gemini `gemini-3.1-flash-lite` on the server.
- POST /api/tts -> Gemini `gemini-3.1-flash-tts-preview` on the server.
- POST /api/convert-to-mp3 -> server-side LAME conversion.
- GEMINI_API_KEY stays server-side. The Android app intentionally does not embed it.
- Android uses a configurable `BuildConfig.API_BASE_URL` to call the deployed backend.

## Browser-only replacements
- localStorage -> SharedPreferences + app-private audio files.
- HTMLAudioElement -> Android MediaPlayer.
- browser downloads -> Android MediaStore Downloads.
- browser clipboard -> Compose clipboard manager.
- browser share -> Android FileProvider + ACTION_SEND.
- browser/PWA install prompt -> normal native APK installation.
- browser navigation -> single native Compose surface (the web app itself is a single page).

## Original source preservation
The original project is stored in its original extracted folder. `android-app` is a sibling folder and was created without editing or deleting the original web files.
