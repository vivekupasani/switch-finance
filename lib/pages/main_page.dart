import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:scrip/pages/discover_page.dart';
import 'package:scrip/pages/home_page.dart';
import 'package:scrip/pages/profile_page.dart';
import 'package:scrip/pages/rewards_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final PageController _pageController = PageController(initialPage: 0);
  final NotchBottomBarController _controller = NotchBottomBarController(
    index: 0,
  );

  final List<Widget> _screens = const [
    HomePage(),
    DiscoverScreen(),
    RewardsScreen(),
    ProfileScreen(),
  ];

  final int maxCount = 5;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _screens,
      ),
      extendBody: true,
      bottomNavigationBar:
          (_screens.length <= maxCount)
              ? AnimatedNotchBottomBar(
                notchBottomBarController: _controller,
                color: Colors.black87,
                showLabel: true,
                shadowElevation: 5,
                kBottomRadius: 28.0,
                notchColor: Colors.deepPurple,
                removeMargins: false,
                bottomBarWidth: MediaQuery.of(context).size.width * 0.9,
                showShadow: true,
                showTopRadius: true,
                durationInMilliSeconds: 300,
                itemLabelStyle: const TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                ),
                elevation: 10,
                kIconSize: 24.0,
                bottomBarItems: const [
                  BottomBarItem(
                    inActiveItem: Icon(Icons.home, color: Colors.grey),
                    activeItem: Icon(Icons.home, color: Colors.white),
                    itemLabel: 'home',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(Icons.explore, color: Colors.grey),
                    activeItem: Icon(Icons.explore, color: Colors.white),
                    itemLabel: 'discover',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(Icons.card_giftcard, color: Colors.grey),
                    activeItem: Icon(Icons.card_giftcard, color: Colors.white),
                    itemLabel: 'rewards',
                  ),
                  BottomBarItem(
                    inActiveItem: Icon(Icons.person, color: Colors.grey),
                    activeItem: Icon(Icons.person, color: Colors.white),
                    itemLabel: 'profile',
                  ),
                ],
                onTap: (index) {
                  _pageController.jumpToPage(index);
                },
              )
              : null,
    );
  }
}
