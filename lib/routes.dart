import 'package:get/get.dart';


import 'add_image.dart';

Transition defaultTransitions = Transition.native;
Transition fade = Transition.fadeIn;

class Routes {
  static const login = '/logIn';
  static const signUp = '/signUp';
  static const forgetPassword = '/forgetPassword';
  static const home = '/home';
  static const addNew = '/addNew';
  static const apiCalling = '/apiCalling';
  static const studentScreen = '/studentScreen';
  static const mobileScreen = '/mobileScreen';
  static const otpVerify = '/otpVerify';
  static const userDetails = '/userDetails';
  static const imageView = '/imageView';

  static final route = [
    // GetPage(name: login, page: () => LogIn(), transition: defaultTransitions),
    // GetPage(name: signUp, page: () => SignUp(), transition: defaultTransitions),
    // GetPage(
    //     name: forgetPassword,
    //     page: () => ForgetPassword(),
    //     transition: defaultTransitions),
    // GetPage(name: home, page: () => Home(), transition: defaultTransitions),
    // GetPage(
    //     name: addNew, page: () => AddNewNote(), transition: defaultTransitions),
    // GetPage(
    //     name: mobileScreen,
    //     page: () => MobileLogin(),
    //     transition: defaultTransitions),
    // GetPage(
    //     name: otpVerify,
    //     page: () => OtpVerify(),
    //     transition: defaultTransitions),
    // GetPage(
    //     name: userDetails,
    //     page: () => UserDetails(),
    //     transition: defaultTransitions),
    GetPage(name: imageView, page: () => ImageView(), transition: fade),
  ];
}
