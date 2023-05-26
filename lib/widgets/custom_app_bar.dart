import 'package:flutter/material.dart';
import 'package:ggpl/config/palette.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.primaryColor
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        toolbarHeight: 80,
        backgroundColor: Palette.primaryColor,
        elevation: 0,
        leading: Row(
          children: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
              ),
              iconSize: 28.0,
              onPressed: () {

              },
            )
          ],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Grounded Goodness'),
                Text('GROCERY SHOPPING STORE',style: TextStyle(fontSize: 12),)
              ],
            ),
            Icon(
              Icons.person_2_outlined,
              size: 40,
            )
          ],
        ),
      ),
    );
  }
}
