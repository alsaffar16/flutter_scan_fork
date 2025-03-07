import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'scan_method_channel.dart';

abstract class ScanPlatform extends PlatformInterface {
  /// Constructs a ScanPlatform.
  ScanPlatform() : super(token: _token);

  static final Object _token = Object();

  static ScanPlatform _instance = MethodChannelScan();

  /// The default instance of [ScanPlatform] to use.
  ///
  /// Defaults to [MethodChannelScan].
  static ScanPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ScanPlatform] when
  /// they register themselves.
  static set instance(ScanPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
