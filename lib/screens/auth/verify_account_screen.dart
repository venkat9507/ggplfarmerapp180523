import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ggpl/config/palette.dart';
import 'package:info_popup/info_popup.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({Key? key}) : super(key: key);

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {

  final _formKey = GlobalKey<FormState>();
  late Timer _timer;
  int _secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        setState(() {
          if (_secondsRemaining < 1) {
            timer.cancel();
            // Perform any additional actions when the timer completes
          } else {
            _secondsRemaining--;
          }
        });
      },
    );
  }

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
            padding: EdgeInsets.all(30.0),
            child: CustomScrollView(
              slivers: [
                _buildVerifyForm()
              ],
            ),
          )
        ],
      ),
    );
  }

  void verifiedSuccess(BuildContext context) {
    showGeneralDialog(
      barrierDismissible: false,
      barrierColor: Colors.black54,
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Container(
            height: 370,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: SizedBox.expand(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/images/icons/verified.png',width: 150,),
                          SizedBox(height: 10,),
                          Text('Verified',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'Product sans',
                            fontSize: 25, decoration: TextDecoration.none
                          ),),
                          SizedBox(height: 10,),
                          Text('Hello..! You have Sucessfully Verify the Account',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Palette.secondaryColor,
                              fontFamily: 'Product sans',
                              fontSize: 17, decoration: TextDecoration.none
                          ),textAlign: TextAlign.center,),
                          SizedBox(height: 10,),
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {

                              },
                              child: Text('BROWSE HOME',style: TextStyle(
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  SliverToBoxAdapter _buildVerifyForm() {
    return SliverToBoxAdapter(
      child: Container(
        child: Column(
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
                    Text('Verify Account',style: TextStyle(
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
                children: [
                  Text(
                    'Verify your Account by Entering Verification Code we send to XXXXXXX ',
                    style: TextStyle(fontSize: 16,color: Palette.secondaryColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            if(value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (newValue) {

                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
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
                                width: 2.0
                              )
                            )
                          ),
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            if(value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (newValue) {

                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
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
                                      width: 2.0
                                  )
                              )
                          ),
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            if(value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (newValue) {

                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
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
                                      width: 2.0
                                  )
                              )
                          ),
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            if(value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (newValue) {

                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
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
                                      width: 2.0
                                  )
                              )
                          ),
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          onChanged: (value) {
                            if(value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          onSaved: (newValue) {

                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
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
                                      width: 2.0
                                  )
                              )
                          ),
                          textAlign: TextAlign.center,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(1),
                            FilteringTextInputFormatter.digitsOnly
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  TextButton(
                    onPressed: () {

                    },
                    child: Text('Resend OTP',style: TextStyle(color: Palette.linkColor,fontSize: 16,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        verifiedSuccess(context);
                      },
                      child: Text('VERIFY',style: TextStyle(fontFamily: 'Inter',fontSize: 16,fontWeight: FontWeight.bold),),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Palette.primaryColor)
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'Resend New Cod e in $_secondsRemaining Sec'
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

