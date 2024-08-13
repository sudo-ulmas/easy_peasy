
import 'easy_peasy_platform_interface.dart';

class EasyPeasy {
  Future<String?> getPlatformVersion() {
    return EasyPeasyPlatform.instance.getPlatformVersion();
  }
}
