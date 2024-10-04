// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {

final void Function(int)? onTabChange;

   MyBottomNavBar({
    super.key,
    required this.onTabChange,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        child: GNav(
          color: Colors.grey[400],
          activeColor: Colors.grey[700],
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade200,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          tabBorderRadius: 24,
          onTabChange: (value) => onTabChange!(value),
          tabs: [
          GButton(
            icon: Icons.home,
            text: 'Shop',
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              text: "Cart",
              ),
        ],
        ),
      ),
    );
  }
}