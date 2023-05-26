import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggpl/screens/screens.dart';

class WelcomeBannerScreen extends StatefulWidget {
  const WelcomeBannerScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeBannerScreen> createState() => _WelcomeBannerScreenState();
}

class _WelcomeBannerScreenState extends State<WelcomeBannerScreen> {

  final PageController _sliderController = PageController();
  int _currentSlider = 0;
  double _slideProgress = 0.3;
  final List<Widget> _slides = [
    SlidePage(color:Colors.blue, heading: 'Browse all the Category', description: 'Eat Fresh Fruits and Vegetables and Try to be Healthy Ergo illi intellegunt quid.', textcolor: Colors.black, image: 'assets/images/welcome/slide-1.png'),
    SlidePage(color:Colors.blue,heading: 'Amazing Discount & Offers', description: 'Healthly Makes store where we deliver Everything on Time Aristo putamus aetatem.', textcolor: Colors.black, image: 'assets/images/welcome/slide-2.png'),
    SlidePage(color:Colors.blue,heading: 'Delivery in 30 Min', description: 'Eat Fresh Fruits and Vegetables and Try to be Healthy Ergo illi intellegunt quid.', textcolor: Colors.white, image: 'assets/images/welcome/slide-3.png'),
  ];

  @override
  void dispose() {
    _sliderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _sliderController,
            itemCount: _slides.length,
            itemBuilder: (BuildContext context, int index) {
              return _slides[index % _slides.length];
            },
            onPageChanged: (int slide) {
              setState(() {
                _currentSlider = slide;
              });
            },
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DotsIndicator(
                  dotsCount: _slides.length,
                  position: _currentSlider,
                  decorator: DotsDecorator(
                    color: Colors.grey, // Inactive color
                    activeColor: Colors.green,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 100.0),
                    child: Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            strokeWidth: 5.0,
                            value: _slideProgress,
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        ),
                        Positioned(
                          left: 10,
                          top: 10,
                          child: SizedBox(
                            height: 80,
                            width: 80,
                            child: ElevatedButton(
                              onPressed: () {
                                if(_currentSlider < _slides.length - 1) {
                                  _sliderController.nextPage(
                                    duration:const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                }
                                if(_currentSlider==0) {
                                  _slideProgress = 0.6;
                                } else if(_currentSlider==1) {
                                  _slideProgress = 1;
                                }
                                if(_currentSlider==2) {
                                  Get.to(LoginScreen());
                                }
                              },
                              child: Icon(
                                Icons.arrow_forward_outlined,
                                //_currentSlider < _slides.length - 1 ? Icons.arrow_forward_outlined : Icons.arrow_right,
                                color: Colors.white,
                                size: 30,
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(20),
                                  backgroundColor: Colors.green,
                                  foregroundColor: Colors.green
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SlidePage extends StatelessWidget {
  final Color color;
  final String heading;
  final String description;
  final Color textcolor;
  final String image;

  const SlidePage({required this.color, required this.heading, required this.description, required this.textcolor, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill
        )
      ),
      child: Container(
        padding: EdgeInsets.all(30),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 220.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  heading,
                  style: TextStyle(fontSize: 24, color: textcolor,fontWeight: FontWeight.w600, fontFamily: 'Inter'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  description,
                  style: TextStyle(fontSize: 16, color: textcolor, fontFamily: 'Inter', fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),


            ],
          ),
        ),
      ),
    );
  }
}
