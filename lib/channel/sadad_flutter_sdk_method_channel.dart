import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import '../entities/sadad_transaction.dart';
import 'sadad_flutter_sdk_platform_interface.dart';

class MethodChannelSadadFlutterSimulator extends SadadFlutterIosSimulatorPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('sadad_flutter_ios_simulator');

  @override
  Future<String?> createTransaction(SadadTransaction transaction) async {
    final result = await methodChannel.invokeMethod<String>('sadad_create_transaction',json.encode(transaction.toJson()));
    return result;
  }
}
