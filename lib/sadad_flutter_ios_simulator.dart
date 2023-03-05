

import 'channel/sadad_flutter_sdk_platform_interface.dart';
import 'entities/sadad_transaction.dart';

class SadadFlutterIosSimulatorSdk {
  Future<String?> createTransaction(SadadTransaction transaction) {
    return SadadFlutterIosSimulatorPlatform.instance.createTransaction(transaction);
  }
}
