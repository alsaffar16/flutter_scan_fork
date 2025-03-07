import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'scan_platform_interface.dart';

/// An implementation of [ScanPlatform] that uses method channels.
class MethodChannelScan extends ScanPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('scan');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
