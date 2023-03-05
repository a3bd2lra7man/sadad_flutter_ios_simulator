import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import '../entities/sadad_transaction.dart';
import 'sadad_flutter_sdk_method_channel.dart';

abstract class SadadFlutterIosSimulatorPlatform extends PlatformInterface {
  SadadFlutterIosSimulatorPlatform() : super(token: _token);

  static final Object _token = Object();

  static SadadFlutterIosSimulatorPlatform _instance = MethodChannelSadadFlutterSimulator();

  static SadadFlutterIosSimulatorPlatform get instance => _instance;

  static set instance(SadadFlutterIosSimulatorPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> createTransaction(SadadTransaction transaction) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
