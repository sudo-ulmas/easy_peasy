import 'package:flutter_test/flutter_test.dart';
import 'package:easy_peasy/easy_peasy.dart';
import 'package:easy_peasy/easy_peasy_platform_interface.dart';
import 'package:easy_peasy/easy_peasy_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEasyPeasyPlatform
    with MockPlatformInterfaceMixin
    implements EasyPeasyPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EasyPeasyPlatform initialPlatform = EasyPeasyPlatform.instance;

  test('$MethodChannelEasyPeasy is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEasyPeasy>());
  });

  test('getPlatformVersion', () async {
    EasyPeasy easyPeasyPlugin = EasyPeasy();
    MockEasyPeasyPlatform fakePlatform = MockEasyPeasyPlatform();
    EasyPeasyPlatform.instance = fakePlatform;

    expect(await easyPeasyPlugin.getPlatformVersion(), '42');
  });
}
