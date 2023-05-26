import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ggpl/config/palette.dart';
import 'package:ggpl/controllers/bottom_nav_bar_controller.dart';
import 'package:ggpl/screens/screens.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin {

  int currentTab = 0;
  final List<Widget> pages = [
    LoginScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentPage = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      floatingActionButton: Container(
        height: MediaQuery.of(context).size.width * 0.18,
        width: MediaQuery.of(context).size.width * 0.18,
        child: FloatingActionButton(
          child: Icon(Icons.search_rounded, size: 35),
          onPressed: () {
          },
          backgroundColor: Palette.floatingIconColor,
          splashColor: Palette.floatingIconColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentPage = HomeScreen();
                        currentTab  = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_outlined,
                          color: currentTab == 0 ? Palette.primaryColor : Palette.secondaryColor,
                          size: 25,
                        ),
                        SizedBox(height: 5,),
                        Text('HOME',style: TextStyle(
                          color: currentTab == 0 ? Palette.primaryColor : Palette.secondaryColor,
                          fontSize: 14
                        ),)
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentPage = LoginScreen();
                        currentTab  = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard_outlined,
                          color: currentTab == 1 ? Palette.primaryColor : Palette.secondaryColor,
                          size: 25,
                        ),
                        SizedBox(height: 5,),
                        Text('MENU',style: TextStyle(
                            color: currentTab == 1 ? Palette.primaryColor : Palette.secondaryColor,
                            fontSize: 14
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentPage = LoginScreen();
                        currentTab  = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.discount_outlined,
                          color: currentTab == 2 ? Palette.primaryColor : Palette.secondaryColor,
                          size: 25,
                        ),
                        SizedBox(height: 5,),
                        Text('OFFER',style: TextStyle(
                            color: currentTab == 2 ? Palette.primaryColor : Palette.secondaryColor,
                            fontSize: 14
                        ),)
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentPage = LoginScreen();
                        currentTab  = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_2_outlined,
                          color: currentTab == 3 ? Palette.primaryColor : Palette.secondaryColor,
                          size: 25,
                        ),
                        SizedBox(height: 5,),
                        Text('PROFILE',style: TextStyle(
                            color: currentTab == 3 ? Palette.primaryColor : Palette.secondaryColor,
                            fontSize: 14
                        ),)
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
