> **Warning:** The sadad_flutter_ios_simulator package is intended for testing purposes only and should not be used as a complete solution for integrating Sadad payments into your app. This package provides a simulator for the Sadad payment integration SDK on iOS, allowing you to test your app on an iOS simulator. However, if you want to deploy your app on an actual iOS device and provide a complete Sadad payment integration solution for your users, you should use the [sadad_flutter_sdk](https://pub.dev/packages/sadad_flutter_sdk) package instead.

<br>

# Getting Started

To use the Sadad Flutter plugin in your project, you'll need to create a Sadad account and integrate your backend  
Here's how:

1. Create a Sadad account and obtain your **merchantId**,**secretKey**
2. Integrate the Sadad backend into your app by following the integration guide provided by Sadad.
3. Obtain a transaction token from the Sadad server by calling the appropriate API endpoint from your backend **[See Application SDK Section](https://developer.sadad.qa)**

### Once you obtain the transaction token you are good to go
<br>

# Usage

1. Add sadad_flutter_ios_simulator to your pubspec.yaml file:
```yaml
dependencies:
  sadad_flutter_ios_simulator: ^0.0.5
```
2. Import the package into your code:
```dart
import 'package:sadad_flutter_ios_simulator/sadad_flutter_ios_simulator.dart';
```
3. Create a SadadTransaction object with the required parameters:
```dart
var transaction = SadadTransaction(
  email: "a3bd2llah@gmail.com",
  mobileNumber: "97431487378",
  customerId: "123456789",
  clientToken: "put the obtained token here", //  PUT THE OBTAINED TOKEN HERE
  transactionAmount: "10000.0",
  orderItems: [const SadadOrderItem(name: "top up", quantity: 1, amount: 10000)],
  orderId: "123456789",
);
```
**Here, clientToken is the token obtained from Sadad.**

4. Call the createTransaction method to initiate the payment process:
```dart
String result;

final sadadFlutterSdkPlugin = SadadFlutterSdk();
try {
  result = await _sadadFlutterSdkPlugin.createTransaction(transaction) ?? 'null';
} on PlatformException {
  result = 'Platform Exception';
}
```
The result should contain the transaction number if the transaction completed(**failed** or **succeed**).  
However, it's possible for the result to be null in certain scenarios:

If there was an error with the API Calling, the result may be null.  
If the transaction data is not in the correct format, the result may be null.  
If the user cancels the transaction, the result may be null.


Now You have the Sadad SDK soluation in your flutter app

***If you find this Sadad Flutter SDK plugin useful, please consider giving it a star on GitHub to show your support. Your feedback and suggestions are also welcome!***
