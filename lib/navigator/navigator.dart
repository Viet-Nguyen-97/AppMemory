import 'package:get/get.dart';
import 'package:memorylife/router.dart';

class AppNavigator {
  AppNavigator._();

  static navigateBack() async {
    Get.back();
  }

  static navigateSplash() async {
    var result = await Get.toNamed(BaseRouter.SPLASH);
    return result;
  }

  static navigateLogin() async {
    var result = await Get.toNamed(BaseRouter.LOGIN);
    return result;
  }

  static navigateBegin() async {
    var result = await Get.toNamed(BaseRouter.SPLASH_ONE);
    return result;
  }

  static navigateTwo() async {
    var result = await Get.toNamed(BaseRouter.SPLASH_TWO);
    return result;
  }

  static navigateThree() async {
    var result = await Get.toNamed(BaseRouter.SPLASH_THREE);
    return result;
  }

  static navigateOtp() async {
    var result = await Get.toNamed(BaseRouter.OTP);
    return result;
  }

  static navigateNavigation() async {
    var result = await Get.toNamed(BaseRouter.NAVIGATION);
    return result;
  }

  static navigateCreateDiary() async {
    var result = await Get.toNamed(BaseRouter.CREATE_DIARY);
    return result;
  }

  static navigateCreateNote() async {
    var result = await Get.toNamed(BaseRouter.CREATE_NOTE);
    return result;
  }
}
