import 'package:flutter/material.dart';
import 'custom_bottom_nav.dart';
import '../authentication.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const Center(child: Text('Cart Screen', style: TextStyle(fontSize: 24))),
    const Center(child: Text('Message Screen', style: TextStyle(fontSize: 24))),
    const Center(child: Text('User Screen', style: TextStyle(fontSize: 24))),
  ];

  final List<BottomNavItem> _navItems = const [
    BottomNavItem(icon: Icons.home_rounded, label: 'Home'),
    BottomNavItem(icon: Icons.shopping_cart_rounded, label: 'Cart'),
    BottomNavItem(icon: Icons.chat_bubble_rounded, label: 'Messages'),
    BottomNavItem(icon: Icons.person_rounded, label: 'Account'),
  ];

  void _onItemTapped(int index) {
    if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: _navItems,
      ),
    );
  }
}