import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ggpl/config/palette.dart';
import 'package:ggpl/screens/screens.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool _isChecked = false;
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
            child: CustomScrollView(
              slivers: [
                _buildRegisterForm()
              ],
            ),
          )
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildRegisterForm() {
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
                    Text('Create Your Grocery Store',style: TextStyle(
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
                  Text('Full Name *',textAlign: TextAlign.start,style: TextStyle(fontSize: 16,color: Palette.secondaryColor)),
                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
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
                  SizedBox(height: 20,),
                  Text('Phone Number *', textAlign: TextAlign.start,style: TextStyle(color: Palette.secondaryColor,fontSize: 16),),
                  SizedBox(height: 10,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      filled: false,
                      contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Palette.formBorder,
                          width: 2.0
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Palette.formBorder,
                          width: 2.0,
                        )
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text('Password *',textAlign: TextAlign.start,style: TextStyle(fontSize: 16,color: Palette.secondaryColor),),
                  SizedBox(height: 10,),
                  TextFormField(
                    obscureText: !_showPassword,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Palette.formBorder,
                          width: 2.0
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                              color: Palette.formBorder,
                              width: 2.0
                          )
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
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        fillColor: MaterialStateProperty.all(Palette.primaryColor),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked == true ? _isChecked = false : _isChecked = true;
                          });
                        },
                      ),
                      Text('I Agree with Terms & Conditions',style: TextStyle(color: Palette.secondaryColor,fontSize: 16),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      child: Text('REGISTER NOW', style: TextStyle(fontFamily: 'Inter',fontSize: 16,fontWeight: FontWeight.bold),),
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
                      Text("Already have an Account? "),
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


