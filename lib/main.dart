import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';
//import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:html/parser.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

void main()  {
  // WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp();
  //options: DefaultFirebaseOptions.currentPlatform,
  runApp(DateMyRoommate());
}

class DateMyRoommate extends StatelessWidget {
  // final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Colors.black,
        ),

        onGenerateRoute: (RouteSettings settings){
          switch (settings.name){
            case '/':
              return MaterialPageRoute(builder: (context) => HomePage());
              break;
            case '/NewUser':
              return MaterialPageRoute(builder: (context) => NewUser());
              break;
            case '/ReturningUser':
              return MaterialPageRoute(builder: (context) => ReturningUser());
              break;
            case '/Roommate':
              return MaterialPageRoute(builder: (context) =>  Roommate());

              break;
          }
        }
    );
  }
}

//homepage: choose if login from existing login or create new
//second page: login as username, store user with API
//third page: input information input year, major and hobby
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  String myHtml = '<body><div> id = "your name"><p><hello> </body>';
  //var info = parse(myHtml);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // "name": "John Smith",
      // "email": "john@example.com"
      // Map<String, dynamic> = jsonDecode(jsonString);

      // print('Howdy, ${user['name']}!');
      // print('We sent the verification link to ${user['email']}.');
        appBar: AppBar(
          title: const Text('Welcome to DateMyRoommate'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                child: const Text("Login as new user"),
                color: Colors.pink,
                onPressed: () {
                  Navigator.pushNamed(context, '/NewUser');
                },
              ),
              FlatButton(

                  child: const Text("Login as a returning user"),
                  color: Colors.yellow,
                  onPressed: () {
                    Navigator.pushNamed(context, '/ReturningUser');
                  }),
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT52bLqGbq8Dm3Z3eEnbMk7zZ5HxlnH808F6A&usqp=CAU'),
            ],
          ),

        ));
  }
}

class NewUser extends StatelessWidget {
  TextEditingController eCtrl = TextEditingController();

  // bool showText = false;
  String username = "";
  String password = "";

  NewUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text('Welcome New User!'),
        ),
        body: Center(

          child: Column(

            children: <Widget>[
              TextField(
                decoration:
                const InputDecoration.collapsed(hintText: "Add Username"),
                onSubmitted: (String text) {
                  username = text;
                },
              ),
              Text("\n\n $username"),
              TextField(
                decoration:
                const InputDecoration.collapsed(hintText: "Add Password"),
                onSubmitted: (String text) {
                  password = text;
                },
              ),
              Text("\n\n $password"),

              FlatButton(
                child: const Text("Go Back"),
                color: Colors.pink,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              FlatButton(
                  child: const Text("Next Page"),
                  color: Colors.yellow,
                  onPressed: () {
                    Navigator.pushNamed(context, '/Roommate');
                  }),
              IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {

                    // showText = true;
                  }),
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeugfMotZiRWka3eu5hkL_uy3Ol3Z7OF5wg&usqp=CAU'),
            ],

          ),
        ));
  }

}

class ReturningUser extends StatelessWidget {
  TextEditingController eCtrl = TextEditingController();

  // bool showText = false;
  String username = "";
  String password = "";

  ReturningUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Returning User!'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              decoration:
              //border: OutlineInputBorder(),
              const InputDecoration.collapsed(hintText: "Add Username"),
              style: TextStyle(fontSize: 20),
              onSubmitted: (String text) {
                username = text;
              },

            ),
            Text("\n\n $username"),
            TextField(
              decoration:
              const InputDecoration.collapsed(hintText: "Add Password"),
              style: TextStyle(fontSize: 20),
              onSubmitted: (String text) {
                password = text;
              },
            ),
            Text("\n\n $password"),
            FlatButton(
              child: const Text("Go Back"),
              color: Colors.pink,
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            FlatButton(
                child: const Text("Next Page"),
                color: Colors.yellow,
                onPressed: () {
                  Navigator.pushNamed(context, '/Roommate');
                }),
            IconButton(
                icon: const Icon(Icons.comment),
                onPressed: () {
                  const Text("Congrats! thanks for submitting your application");
                  // showText = true;
                }),
            Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeugfMotZiRWka3eu5hkL_uy3Ol3Z7OF5wg&usqp=CAU'),
          ],
        ),
      ),
    );
  }
}
class htmlWidget{
  Widget html = Html(
    data: """<div>
        <h1>Enter your name</h1>
        <p>so glad you are using this app</p>
        <h3>Enter your year in school</h3>
        <ul>
          <li>cool</li>
          <li>Great</li>
          <li>We will let you know shortly if you are a candidate</li>
        </ul>
      </div>""",
  );
}

class Roommate extends StatelessWidget {
  TextEditingController eCtrl = TextEditingController();

  // bool showText = false;
  String name = "";
  String year = "";
  String hobby = "";

  Roommate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text('Create your profile' '$name'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              TextField(
                decoration:
                const InputDecoration.collapsed(hintText: "Add Name"),
                style: TextStyle(fontSize: 20),
                onSubmitted: (String text) {
                  name = text;
                },
              ),
              Text("\n\n $name"),
              TextField(
                decoration:
                const InputDecoration.collapsed(hintText: "Add Year"),
                style: TextStyle(fontSize: 20),
                onSubmitted: (String text) {
                  year = text;
                },
              ),
              Text("\n\n $year"),
              TextField(
                decoration:
                const InputDecoration.collapsed(hintText: "Add hobby"),
                style: TextStyle(fontSize: 20),
                onSubmitted: (String text) {
                  hobby = text;
                },
              ),
              Text("\n\n $hobby"),
              FlatButton(
                child: const Text("Go Back"),
                color: Colors.pink,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              FlatButton(
                  child: const Text("Home Page"),
                  color: Colors.yellow,
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  }),
              IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () {
                  }
              ),
              // title: const Text('Thanks!');
              // content: Text(
              //     'You typed "$name", which has length ${name.characters.length}.');
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDeugfMotZiRWka3eu5hkL_uy3Ol3Z7OF5wg&usqp=CAU'),
            ],
          ),
        ));
  }
}










// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key)// import 'package:flutter/material.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         // This is the theme of your application.
// //         //
// //         // Try running your application with "flutter run". You'll see the
// //         // application has a blue toolbar. Then, without quitting the app, try
// //         // changing the primarySwatch below to Colors.green and then invoke
// //         // "hot reload" (press "r" in the console where you ran "flutter run",
// //         // or simply save your changes to "hot reload" in a Flutter IDE).
// //         // Notice that the counter didn't reset back to zero; the application
// //         // is not restarted.
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const MyHomePage(title: 'Flutter Demo Home Page'),
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({Key? key, required this.title}) : super(key: key);
// //
// //   // This widget is the home page of your application. It is stateful, meaning
// //   // that it has a State object (defined below) that contains fields that affect
// //   // how it looks.
// //
// //   // This class is the configuration for the state. It holds the values (in this
// //   // case the title) provided by the parent (in this case the App widget) and
// //   // used by the build method of the State. Fields in a Widget subclass are
// //   // always marked "final".
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;
// //
// //   void _incrementCounter() {
// //     setState(() {
// //       // This call to setState tells the Flutter framework that something has
// //       // changed in this State, which causes it to rerun the build method below
// //       // so that the display can reflect the updated values. If we changed
// //       // _counter without calling setState(), then the build method would not be
// //       // called again, and so nothing would appear to happen.
// //       _counter++;
// //     });
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // This method is rerun every time setState is called, for instance as done
// //     // by the _incrementCounter method above.
// //     //
// //     // The Flutter framework has been optimized to make rerunning build methods
// //     // fast, so that you can just rebuild anything that needs updating rather
// //     // than having to individually change instances of widgets.
// //     return Scaffold(
// //       appBar: AppBar(
// //         // Here we take the value from the MyHomePage object that was created by
// //         // the App.build method, and use it to set our appbar title.
// //         title: Text(widget.title),
// //       ),
// //       body: Center(
// //         // Center is a layout widget. It takes a single child and positions it
// //         // in the middle of the parent.
// //         child: Column(
// //           // Column is also a layout widget. It takes a list of children and
// //           // arranges them vertically. By default, it sizes itself to fit its
// //           // children horizontally, and tries to be as tall as its parent.
// //           //
// //           // Invoke "debug painting" (press "p" in the console, choose the
// //           // "Toggle Debug Paint" action from the Flutter Inspector in Android
// //           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
// //           // to see the wireframe for each widget.
// //           //
// //           // Column has various properties to control how it sizes itself and
// //           // how it positions its children. Here we use mainAxisAlignment to
// //           // center the children vertically; the main axis here is the vertical
// //           // axis because Columns are vertical (the cross axis would be
// //           // horizontal).
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             const Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headline4,
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add),
// //       ), // This trailing comma makes auto-formatting nicer for build methods.
// //     );
// //   }
// // };
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug painting" (press "p" in the console, choose the
//           // "Toggle Debug Paint" action from the Flutter Inspector in Android
//           // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//           // to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
