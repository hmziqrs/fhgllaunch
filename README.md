# FGHLLAUNCH

A simple command-line application.

## Requirements

- Dart 12.2 +

## Install

> `flutter pub global activate fhgllaunch`

## Troubleshoot

- Command not found
  > This error is usually thrown if you don't have `flutter/.pub-cache/bin` in your path
  - Solution [macOS/Linux]:
    <br />Navigate to the path where your install/save flutter SDK (For me flutter is installed at `$HOME/flutter`).
    <br />Now add `$HOME/flutter/.pub-cache/bin` in `.zshrc`, `.bashrc` or the where you manage paths generally
