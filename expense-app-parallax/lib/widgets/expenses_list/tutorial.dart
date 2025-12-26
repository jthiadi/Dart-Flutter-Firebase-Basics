import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  _TutorialScreenState createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  final PageController _pageController = PageController();
  double currpage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_pageListener);
  }

  @override
  void dispose() {
    _pageController.removeListener(_pageListener);
    _pageController.dispose();
    super.dispose();
  }

  void _pageListener() {
    setState(() {
      currpage = _pageController.page ?? 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutorial'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(39.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, size: 90, color: Colors.blue),
                SizedBox(height: 15),
                Transform.translate(
                  offset: Offset(-(currpage) * 1.5 * MediaQuery.of(context).size.width, 0),
                  child: Text(
                    "Press Add button at the upper-right corner to track a new expense.",
                    style: TextStyle(fontSize: 26.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 28),
                Transform.translate(
                  offset: Offset(-(currpage) * 2.5 * MediaQuery.of(context).size.width, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text("Next"),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(39.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.swipe, size: 90, color: Colors.blue), // Icon above the text
                SizedBox(height: 15),
                Transform.translate(
                  offset: Offset(-(currpage-1) * 1.5 * MediaQuery.of(context).size.width, 0),
                  child: Text(
                    "Swipe a tracked expense left or right to delete it.",
                    style: TextStyle(fontSize: 26.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 28),
                Transform.translate(
                  offset: Offset(-(currpage-1) * 2.5 * MediaQuery.of(context).size.width, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text("Done"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}