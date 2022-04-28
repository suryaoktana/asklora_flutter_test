# asklora_flutter_test Result
Senior Mobile Developer Assessment - Cryptocurrency Market Watch List

# Polygon API Rule
- Make sure you are running with only 1 device simultaneously
  due to a limited amount number of websocket connection

# How to run the App
- Make sure you are running the latest Android (32) and Flutter SDK (2.10.4+)
- Run "flutter pub get" on terminal to get all plugin needed in the pubspec.yaml
- Make sure you already open or start an android emulator
- Run "flutter run" to run the app

#How to build the App
- Make sure you are running the latest Android (32) and Flutter SDK (2.10.4+)
- Run "flutter pub get" on terminal to get all plugin needed in the pubspec.yaml
- Run "flutter build apk --release" to build the app

# How to manage token listed in the App
- Open file token_data.dart at root/lib/const/token_data.dart
- There will be static data called dataToken in the TokenDataList class
- You can add some token from the ticker data which you can get from polygon.io with the link below
    https://api.polygon.io/v3/reference/tickers?market=crypto&active=true&sort=ticker&order=asc&limit=500&apiKey=kAHMK3303qDjYC5gzsKtpCA537NvQIaw
- Manually add "-" symbol from polygon ticker variable. Example there is data called: "ticker": "X:AAVEUSD",
    you can get ticker data after "X:" and add "-" before "USD". The result will be "AAVE-USD" and now you can add it on dataToken
- Add assets that you can manually store on root/assets/token_icon and add the path to dataToken
- Specify the name on dataToken
- Run "flutter pub get" to instansiate assets data to the app itself and you are all set!

