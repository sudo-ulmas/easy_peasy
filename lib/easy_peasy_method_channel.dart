import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'easy_peasy_platform_interface.dart';

/// An implementation of [EasyPeasyPlatform] that uses method channels.
class MethodChannelEasyPeasy extends EasyPeasyPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('easy_peasy');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
