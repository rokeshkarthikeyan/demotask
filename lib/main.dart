import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_prj/page1.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController pageController = PageController(initialPage: 0);
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: pageController,
        children: const <Widget>[
          Page1(),
          Center(child: Portfolio()),
          Center(child: Dashboard()),
          Center(child: Price()),
          Center(child: Settings())
        
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5.0,
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          height: 70,
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12.0,
            unselectedFontSize: 12.0,
            currentIndex: _selectedIndex,
            selectedItemColor: Color.fromRGBO(18, 104, 255, 1),
            unselectedItemColor: Colors.black,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
                pageController.jumpToPage(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: getSVGImage('lib/assets/home.svg',
                      color: Color.fromRGBO(18, 104, 255, 1),
                      height: 25.0,
                      width: 25.0,
                      iconName: 'home',
                      isColor: false),
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: getSVGImage('lib/assets/portfolio.svg',
                      color: Colors.black54,
                      height: 25.0,
                      width: 25.0,
                      iconName: 'portfolio',
                      isColor: false),
                ),
                label: 'portfolio',
              ),
              BottomNavigationBarItem(
                icon: Container(
                    height: 40,
                    width: 43,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(18, 104, 255, 1),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: getSVGImage('lib/assets/menu_center.svg',
                        color: Colors.white,
                        height: 25.0,
                        width: 25.0,
                        iconName: '',
                        isColor: false)),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: getSVGImage('lib/assets/price.svg',
                      color: Colors.black54,
                      height: 25.0,
                      width: 25.0,
                      iconName: 'price',
                      isColor: false),
                ),
                label: 'price',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: getSVGImage('lib/assets/settings.svg',
                      color: Colors.black54,
                      height: 25.0,
                      width: 25.0,
                      iconName: 'settings',
                      isColor: false),
                ),
                label: 'settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Portfolio');
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Dashboard');
  }
}

class Price extends StatelessWidget {
  const Price({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Price');
  }
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text('Settings');
  }
}

Widget getSVGImage(
  String url, {
  Color? color,
  dynamic width,
  dynamic height,
  String? iconName,
  bool isColor = true,
}) {
  return SvgPicture.asset(
    url,
    color: color,
    height: height,
    width: width,
    fit: BoxFit.contain,
  );
}
