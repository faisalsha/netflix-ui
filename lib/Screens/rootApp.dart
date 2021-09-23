import 'package:flutter/material.dart';
import 'package:netflix/Screens/home_page.dart';
import 'package:netflix/json/root_app_json.dart';

class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int activeTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: activeTab,
      children: [
        HomePage(),
        Center(
          child: Text(
            'Coming Soon',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Center(
          child: Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Center(
          child: Text(
            'Downloads',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    return Container(
      alignment: Alignment.bottomRight,
      height: 60,
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20.0, top: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(items.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeTab = index;
                    print(activeTab.toString());
                  });
                },
                child: Column(
                  children: [
                    Icon(
                      items[index]['icon'],
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      items[index]['text'],
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
              );
            })),
      ),
    );
  }
}
