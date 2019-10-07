import 'package:flutter/material.dart';
import 'package:json_place_holder/models/post.dart';
import 'package:json_place_holder/services/post_service.dart';
import 'package:json_place_holder/widgets/about.dart';
import 'package:json_place_holder/widgets/post_card.dart';

void main() => runApp(MyApp());

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
      home: MyHomePage(title: 'My Post'),
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

var posts = <Post> [
  Post(
    id: 1,
    userId: 1,
    title: "this is post title 1",
    body: "this is post body 1" 
  ),
  Post(
    id: 2,
    userId: 1,
    title: "this is post title 2",
    body: "this is post body 2" 
  ),
  Post(
    id: 3,
    userId: 1,
    title: "this is post title 3",
    body: "this is post body 3" 
  ),
  Post(
    id: 4,
    userId: 2,
    title: "this is post title 4",
    body: "this is post body 4" 
  )
];

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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Image.asset(
                "assets/images/logo.png",
                scale: 3.0,
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(children: <Widget>[
                ListTile(
                  leading: Icon(Icons.ac_unit),
                  title: Text("Option"),
                  onTap: () {
                    print("option is tapped");
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text("About"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => About())
                    );
                  },
                )
              ],)
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: PostService.fetchPosts(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              Post post = snapshot.data[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  PostCard(post: post)
                ],
              );
            }
          );
        }
      )
    );
  }
}
