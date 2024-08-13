import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'easy_peasy_method_channel.dart';

abstract class EasyPeasyPlatform extends PlatformInterface {
  /// Constructs a EasyPeasyPlatform.
  EasyPeasyPlatform() : super(token: _token);

  static final Object _token = Object();

  static EasyPeasyPlatform _instance = MethodChannelEasyPeasy();

  /// The default instance of [EasyPeasyPlatform] to use.
  ///
  /// Defaults to [MethodChannelEasyPeasy].
  static EasyPeasyPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EasyPeasyPlatform] when
  /// they register themselves.
  static set instance(EasyPeasyPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
