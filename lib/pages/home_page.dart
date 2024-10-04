// ignore_for_file: prefer_const_constructors

import 'package:ecommerce_ui/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

//pages to disply

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      appBar: AppBar(
        leading: Builder(builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: const Icon(Icons.menu),
            ),
            color: Colors.black,
          );
        }),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey.shade800,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // logo
            Column(
              children: [
                DrawerHeader(
                    child: Image.asset(
                  'lib/images/logo.png',
                  color: Colors.pink,
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Divider(
                color: Colors.pink,
              ),
            ),
            // other pages
            const Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                textColor: Colors.white,
                iconColor: Colors.pink,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
                textColor: Colors.white,
                iconColor: Colors.pink,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logut"),
                textColor: Colors.white,
                iconColor: Colors.pink,
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
