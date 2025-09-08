import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/rendering.dart'; // 👈 Add this

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;
  bool _isNavVisible = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  // Dummy pages
  final List<Widget> _pages = [
    _buildPage("Home Page"),
    _buildPage("Search Page"),
    _buildPage("Post Upload Page"),
    _buildPage("Notifications Page"),
    _buildPage("Messages Page"),
    _buildPage("Profile Page"),
  ];

  static Widget _buildPage(String title) {
    return NotificationListener<UserScrollNotification>(
      onNotification: (notification) {
        return false; // Scroll detection handled outside
      },
      child: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: 20,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.only(bottom: 12),
          elevation: 2,
          child: ListTile(title: Text("$title - Item ${index + 1}")),
        ),
      ),
    );
  }

  void _onScroll(UserScrollNotification notification) {
    if (notification.direction == ScrollDirection.reverse && _isNavVisible) {
      setState(() => _isNavVisible = false);
    } else if (notification.direction == ScrollDirection.forward && !_isNavVisible) {
      setState(() => _isNavVisible = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Pureloom',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          _onScroll(notification);
          return true;
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _currentIndex = index),
          children: _pages,
        ),
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        height: _isNavVisible ? kBottomNavigationBarHeight : 0,
        child: Wrap(
          children: [
            BottomNavigationBar(
              currentIndex: _currentIndex,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedIconTheme: IconThemeData(size: 28, color: Colors.black),
              unselectedIconTheme: IconThemeData(size: 26, color: Colors.grey),
              onTap: (index) {
                setState(() => _currentIndex = index);
                _pageController.jumpToPage(index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: 'Post'),
                BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
                BottomNavigationBarItem(icon: Icon(Icons.email_outlined), label: 'Messages'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
