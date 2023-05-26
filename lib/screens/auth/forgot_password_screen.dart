import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ggpl/config/palette.dart';
import 'package:ggpl/screens/screens.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final _formKey = GlobalKey<FormState>();


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
            padding: EdgeInsets.all(20.0),
            child: CustomScrollView(
              slivers: [
                _buildForgotPasswordForm()
              ],
            ),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildForgotPasswordForm() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
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
                    SizedBox(height: 50,),
                    Text('Enter Your Mobile Number',style: TextStyle(
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Phone Number',style: TextStyle(fontSize: 16.0,color: Palette.secondaryColor),),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 16.0,horizontal: 16.0),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Palette.formBorder,
                          width: 2.0
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Palette.formBorder,
                          width: 2.0
                        )
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text('GET OTP',style: TextStyle(fontFamily: 'Inter',fontSize: 16, fontWeight: FontWeight.bold),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Palette.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Remember Password Back to"),
                      TextButton(
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                        child: Text('LOGIN', style: TextStyle(color: Palette.linkColor),),
                      )
                    ],
                  ),
                  SizedBox(height: 80,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
