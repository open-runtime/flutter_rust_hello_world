## Getting Started
Ensure the flutter versions are lined up currently I am on the beta channel of flutter, can switch this via the command line
```
flutter channel beta
```

also here is the download link to flutter
https://docs.flutter.dev/get-started/install

How to run the project?

```
flutter pub get
flutter run -d macos
```

## Resources:

Here is a link to the flutter rust bridge getting started that I used to spin this project up:
https://cjycode.com/flutter_rust_bridge/quickstart

## Notes:

Modify the rust code and see the modification reflected in flutter/dart
```
flutter_rust_bridge_codegen generate
```

or can use --watch to automatically re-generate when code changes

```
flutter_rust_bridge_codegen generate --watch
```

building the rust dynamic library:(can remove the flag for default debug)
```
cd rust

cargo build --release
```
