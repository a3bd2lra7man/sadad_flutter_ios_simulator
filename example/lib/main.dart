import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:sadad_flutter_ios_simulator/entities/sadad_order_item.dart';
import 'package:sadad_flutter_ios_simulator/entities/sadad_transaction.dart';
import 'package:sadad_flutter_ios_simulator/sadad_flutter_ios_simulator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _result = 'Unknown';
  final _sadadFlutterSdkPlugin = SadadFlutterIosSimulatorSdk();

  @override
  void initState() {
    super.initState();
    startSadadTransaction();
  }

  Future<void> startSadadTransaction() async {
    String result;

    var transaction = SadadTransaction(
        email: "a3bd2llah@gmail.com",
        mobileNumber: "97431487378",
        customerId: "123456789",
        // TODO: PUT your token here
        clientToken: "",
        transactionAmount: "10000.0",
        orderItems: [const SadadOrderItem(name: "top up", quantity: 1, amount: 10000)],
        orderId: "123456789");
    try {
      result = await _sadadFlutterSdkPlugin.createTransaction(transaction) ?? 'Unknown platform version';
    } on PlatformException {
      result = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sadad IOS Simulator Sdk'),
        ),
        body: Center(
          child: Text('sadad result is : $_result\n'),
        ),
      ),
    );
  }
}
