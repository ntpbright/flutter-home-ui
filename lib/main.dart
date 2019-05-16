import 'package:flutter/material.dart';
import 'package:hotel_ui/bottom-bar.dart';
import 'package:hotel_ui/categories-navigator.dart';
import 'package:hotel_ui/details.dart';

void main() => runApp(MyApp());

String img =
    "https://passivehouseplus.ie/media/k2/items/cache/fc5d9d8578a06f6d4c69c78df34d3f3a_XL.jpg?t=-62169984000";

String avatar =
    "https://heavyeditorial.files.wordpress.com/2017/07/jessica-johnson-5.jpg?w=531&quality=65&strip=all&h=531";

String img2 =
    "http://www.dubaiweek.ae/wp-content/uploads/2017/10/Krusty-The-Cone-1-e1507813664264.jpg";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.black,
              size: 32,
            ),
            Icon(
              Icons.search,
              color: Colors.black,
              size: 32,
            ),
          ],
        ),
      ),
      body: Container(
        width: width,
        height: height,
        // child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  CategoriesNavigator(
                    categories: [
                      "Latest",
                      "Decorative",
                      "Music",
                      "Style",
                    ],
                    onChangeActiveTab: (int index) {},
                  ),
                  SizedBox(height: 10),
                  Flexible(
                    flex: 1,
                    child: LayoutBuilder(
                      builder: (BuildContext c, BoxConstraints constraints) {
                        return ListView(
                          padding: const EdgeInsets.only(left: 20),
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            _buildItem(width, constraints),
                            SizedBox(width: 15),
                            _buildItem(width, constraints),
                            SizedBox(width: 15),
                            _buildItem(width, constraints),
                          ],
                        );
                      },
                    ),
                  ),
                  // SizedBox(height: 10),
                  Flexible(
                    flex: 1,
                    child: LayoutBuilder(
                      builder: (BuildContext c, BoxConstraints constraints) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Recommend",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 15),
                            Expanded(
                              child: Container(
                                height: constraints.maxHeight,
                                width: constraints.maxWidth,
                                child: ListView(
                                  children: <Widget>[
                                    _buildRecommendItem(constraints),
                                    SizedBox(height: 10),
                                    _buildRecommendItem(constraints),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 60),
                ],
              ),
              Positioned(
                bottom: 0,
                width: width,
                height: 70,
                child: BottomBar(
                  onChangeActiveTab: (int index) {},
                ),
              ),
            ],
          ),
        // )
      ),
    );
  }

  Widget _buildRecommendItem(BoxConstraints constraints) {
    double height = constraints.maxHeight * .50;

    return Container(
      height: height,
      width: constraints.maxWidth,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 15,
            bottom: 0,
            width: constraints.maxWidth - 70,
            height: height - 15,
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: constraints.maxWidth * .25),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    //boxShadow: shadow1,
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.3,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.only(right: 8),
                          leading: CircleAvatar(
                            backgroundColor: Colors.grey,
                            backgroundImage: new NetworkImage(avatar),
                          ),
                          title: RichText(
                            text: new TextSpan(
                              text: 'by ',
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                              children: <TextSpan>[
                                new TextSpan(
                                  text: 'Jennifer Carol',
                                  style: new TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          subtitle: Text(
                            "January 23, 2019",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Text(
                            "Ice Cream to Happy day",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(height: 22),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xffff8993),
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            width: constraints.maxWidth * .26,
            height: height - 20,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(img2),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildItem(double width, BoxConstraints constraints) {
    return Container(
      width: width - 40,
      child: Builder(builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => NewsAppConceptDetails()),
            );
          },
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                width: width - 45,
                height: constraints.maxHeight * .65,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(img),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                width: width - 45,
                height: constraints.maxHeight * .55,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.grey,
                            width: 0.5,
                          ),
                          //boxShadow: shadow1,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage: new NetworkImage(avatar),
                                ),
                                title: RichText(
                                  text: new TextSpan(
                                    text: 'by ',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                    children: <TextSpan>[
                                      new TextSpan(
                                        text: 'Jennifer Carol',
                                        style: new TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                subtitle: Text(
                                  "January 23, 2019",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(
                                  "Beatiful House in Malang",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                    "lorem ipsum color sit amet, consectetur"),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        top: 10,
                        child: Icon(
                          Icons.favorite,
                          color: Color(0xffff8993),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}