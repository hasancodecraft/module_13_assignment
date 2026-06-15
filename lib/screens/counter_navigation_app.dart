import 'package:flutter/material.dart';
import 'details_screen.dart';

class CounterNavigationApp extends StatefulWidget {
  const CounterNavigationApp({super.key});

  @override
  State<CounterNavigationApp> createState() => _CounterNavigationAppState();
}

class _CounterNavigationAppState extends State<CounterNavigationApp> with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  int counter = 0;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdf5ff),
      appBar: AppBar(
        title: selectedIndex == 0 ? Text('Home') : Text(''),
        backgroundColor: Color(0xfffdf5ff),
        elevation: 0,
      ),
      body: selectedIndex == 0
          ? Column(
              children: [
                Visibility(
                  visible: false,
                  child: TabBar(
                    controller: tabController,
                    tabs: [
                      Tab(text: 'Counter'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      counterTab(),
                    ],
                  ),
                ),
              ],
            )
          : aboutPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }

  Widget counterTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Counter value', style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          Text(
            counter.toString(),
            style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  incrementCounter();
                },
                child: Text('Increment'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(counterValue: counter),
                    ),
                  );
                },
                child: Text('Open Details'),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget aboutPage() {
    return Center(
      child: Text(
        'Welcome',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}