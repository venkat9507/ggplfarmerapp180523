import 'package:get/get.dart';
import 'package:ggpl/widgets/bottom_nav_bar.dart';
import '../screens/screens.dart';

class Routes {
  static final routes =[
    GetPage(
      name: '/root',
      page:() => WelcomeScreen(),
      transition: Transition.zoom,
      transitionDuration: Duration(milliseconds: 500)
    ),
    GetPage(
        name: '/welcome',
        page:() => WelcomeBannerScreen(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)
    ),
    GetPage(
        name: '/login',
        page:() => LoginScreen(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)
    ),
    GetPage(
        name: '/register',
        page:() => RegisterScreen(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)
    ),
    GetPage(
        name: '/forgot-password',
        page:() => ForgotPasswordScreen(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)
    ),
    GetPage(
        name: '/verify-account',
        page:() => VerifyAccountScreen(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)
    ),
    GetPage(
        name: '/home',
        page:() => BottomNavBar(),
        transition: Transition.zoom,
        transitionDuration: Duration(milliseconds: 500)
    ),
  ];
}