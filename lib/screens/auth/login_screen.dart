import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ggpl/config/palette.dart';
import 'package:ggpl/screens/screens.dart';
import 'package:ggpl/widgets/bottom_nav_bar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  void _togglevisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/login-bottom.png'),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(),
            child: CustomScrollView(
              slivers: [
                _loginForm()
              ],
            ),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _loginForm() {

    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png',width: 120,),
                    SizedBox(height: 15,),
                    Text('Welcome to Our Grocery Store',style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),textAlign: TextAlign.center,)
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone Number *',textAlign: TextAlign.start,style: TextStyle(fontSize: 16,color: Palette.secondaryColor)),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      filled: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 17.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Palette.formBorder,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Palette.formBorder,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Password *',textAlign: TextAlign.start,style: TextStyle(fontSize: 16,color: Palette.secondaryColor)),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      filled: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 17.0),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Palette.formBorder,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Palette.formBorder,
                          width: 2.0,
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          _togglevisibility();
                        },
                        child: Icon(
                          _showPassword ? Icons.visibility : Icons
                              .visibility_off, color: Colors.grey,),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(ForgotPasswordScreen());
                        },
                        child: Text('Forgot Password ?',style: TextStyle(
                            fontSize: 16, color: Palette.secondaryColor
                        ),),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(BottomNavBar());
                      },
                      child: Text('LOGIN',style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          color: Colors.white
                      ),),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Palette.primaryColor)
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Image.asset('assets/images/icons/google.png'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shadowColor: MaterialStateProperty.all(Palette.formBorder),
                          elevation: MaterialStateProperty.all(5),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              )
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      TextButton(
                        onPressed: () {},
                        child: Image.asset('assets/images/icons/facebook.png'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shadowColor: MaterialStateProperty.all(Palette.formBorder),
                          elevation: MaterialStateProperty.all(5),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              )
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      TextButton(
                        onPressed: () {},
                        child: Image.asset('assets/images/icons/apple.png'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shadowColor: MaterialStateProperty.all(Palette.formBorder),
                          elevation: MaterialStateProperty.all(5),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8))
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account ? "),
                      TextButton(
                        onPressed: () {
                          Get.to(RegisterScreen());
                        },
                        child: Text('REGISTER NOW', style: TextStyle(color: Palette.linkColor),),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}



