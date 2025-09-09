import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Example notification/message counts
  int notificationsCount = 3;
  int messagesCount = 4;

  final List<Widget> _pages = [
    Center(child: Text('Home', style: TextStyle(fontSize: 24))),
    Center(child: Text('Search', style: TextStyle(fontSize: 24))),
    Center(child: Text('Post', style: TextStyle(fontSize: 24))),
    Center(child: Text('Notifications', style: TextStyle(fontSize: 24))),
    Center(child: Text('Messages', style: TextStyle(fontSize: 24))),
    Center(child: Text('Profile', style: TextStyle(fontSize: 24))),
  ];

  Widget _buildIconWithBadge(IconData icon, bool isSelected, int count) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Icon(icon, size: isSelected ? 28 : 24, color: isSelected ? Colors.black : Colors.grey[400]),
        if (count > 0)
          Positioned(
            right: -6,
            top: -6,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              constraints: BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Center(
                child: Text(
                  '$count',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Pureloom',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 2; // Index for the 'Post' page
          });
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white, size: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey[400],
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: [
              BottomNavigationBarItem(
                icon: Icon(_currentIndex == 0 ? Icons.home_filled : Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(_currentIndex == 1 ? Icons.search : Icons.search_outlined),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: SizedBox.shrink(), // Placeholder for the FloatingActionButton
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithBadge(
                  _currentIndex == 3 ? Icons.notifications_active : Icons.notifications_none_outlined,
                  _currentIndex == 3,
                  notificationsCount,
                ),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: CircleAvatar(
                    radius: _currentIndex == 4 ? 14 : 12,
                    backgroundColor: _currentIndex == 4 ? Colors.black : Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: ClipOval(
                        child: Image.network(
                          'https://placekitten.com/50/50',
                          fit: BoxFit.cover,
                          width: _currentIndex == 4 ? 26 : 22,
                          height: _currentIndex == 4 ? 26 : 22,
                        ),
                      ),
                    ),
                  ),
                ),
                label: 'Profile',
              ),
            ],
            onTap: (index) {
              if (index != 2) { // Prevents tapping the 'Post' placeholder
                setState(() {
                  _currentIndex = index;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
