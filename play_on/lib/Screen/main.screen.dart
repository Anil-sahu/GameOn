import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:play_on/Screen/Home/Home.screen.dart';
import 'package:play_on/constant/colors.constant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  late PageController _pageController;
  String title = "PlayOn";
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondryColor,
        elevation: 0,
        title: Text(title),
        centerTitle: true,
        actions: [
          Container(
              width: 35,
              height: 35,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(right: 20),
              decoration:
                  BoxDecoration(color: primarColor, shape: BoxShape.circle),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.person,
                    color: secondryColor,
                    size: 20,
                  )))
        ],
      ),
      drawer: Container(
        width: MediaQuery.of(context).size.width - 30,
        color: secondryColor,
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
              if (_currentIndex == 1) {
                title = "My Match";
              }
              if (_currentIndex == 2) {
                title = "Winner";
              }
              if (_currentIndex == 3) {
                title = "Setting";
              }
              if (_currentIndex == 0) {
                title = "Match";
              }
            });
          },
          children: <Widget>[
            const HomePage(),
            Container(
              color: primarColor,
              child: const Center(child: Text("MyMatch")),
            ),
            Container(
              color: primarColor,
              child: const Center(child: Text("Winner")),
            ),
            Container(
              color: primarColor,
              child: const Center(child: Text("Setting")),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: secondryColor,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: primarColor,
              inactiveColor: shadowColor,
              title: const Text('Home'),
              icon: const Icon(Icons.home)),
          BottomNavyBarItem(
              activeColor: primarColor,
              inactiveColor: shadowColor,
              title: const Text('MyMatches'),
              icon: const Icon(FontAwesomeIcons.trophy)),
          BottomNavyBarItem(
              activeColor: primarColor,
              inactiveColor: shadowColor,
              title: const Text('Winner'),
              icon: const Icon(
                FontAwesomeIcons.medal,
                size: 20,
              )),
          BottomNavyBarItem(
              activeColor: primarColor,
              inactiveColor: shadowColor,
              title: const Text('Setting'),
              icon: const Icon(FontAwesomeIcons.gear)),
        ],
      ),
    );
  }
}
