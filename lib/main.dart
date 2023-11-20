import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.grey,
          appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey, // Set the AppBar background color to grey
        ),
        ),
        title: 'Flutter Provider Example',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/second': (context) => SecondScreen(),
          '/third': (context) => ThirdScreen(),
          '/fourth': (context) => FourthScreen(),
          '/fifth': (context) => FifthScreen(),
        },
      ),
    );
  }
}

class AppData extends ChangeNotifier {
  bool isLiked = false;

  void toggleLike() {
    isLiked = !isLiked;
    notifyListeners();
  }
  String message = '';

  void setMessage(String newMessage) {
    message = newMessage;
    notifyListeners();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      backgroundColor: Colors.yellow,
      body:
      Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/images/Uma.jpg', height: 400,),
          const Text('I am crazy about many sports like fottball, table tennis, weightlifting and so on', style: TextStyle(fontSize: 28.0),),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
            ),
            onPressed: () async {
              final result = await Navigator.pushNamed(context, '/second', arguments: 'Hello from Home!');
              if (result != null) {
                Provider.of<AppData>(context, listen: false).setMessage(result as String);
              }
            },
            child: const Text('Go to  the Second Screen'),
          ),
          Consumer<AppData>(
            builder: (context, appData, child) => Text(appData.message),
          ),
          Consumer<AppData>(
              builder: (context, appData, _) => IconButton(
                icon: appData.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                onPressed: () {
                  appData.toggleLike();
                },
                color: Colors.red, // Set the color of the like icon
                iconSize: 36, // Set the size of the like icon
              )),
        ],
      ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second')),
      body:
      Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/images/CR7.jpg', height: 400),
          Text('Cristiano Ronaldo is my most lovely football player. He is my idol.', style: TextStyle(fontSize: 24.0)),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, // Set the button color to blue
            ),
            onPressed: () async {
              final result = await Navigator.pushNamed(context, '/third', arguments: 'Hello from Second!');
              if (result != null) {
                Navigator.pop(context, 'Received: $result');
              }
            },
            child: Text('Go to the Third Screen'),
          ),
          Consumer<AppData>(
              builder: (context, appData, _) => IconButton(
                icon: appData.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                onPressed: () {
                  appData.toggleLike();
                },
                color: Colors.red, // Set the color of the like icon
                iconSize: 36, // Set the size of the like icon
              ))
        ],
      ),
      ),
    );
  }
}


class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third')),
      backgroundColor: Colors.deepPurple,
      body:
      Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/images/malong.jpg', height: 400),
          SizedBox(height: 20.0),
          Text('For the table tennis my idol is Ma Long. He is from China', style: TextStyle(fontSize: 24.0),),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black38, // Set the button color to blue
            ),
            onPressed: () async {
              final result = await Navigator.pushNamed(context, '/fourth', arguments: 'Hello from Third!');
              if (result != null) {
                Navigator.pop(context, 'Received: $result');
              }
            },
            child: Text('Go to Fourth Screen'),
          ),
          Consumer<AppData>(
              builder: (context, appData, _) => IconButton(
                icon: appData.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                onPressed: () {
                  appData.toggleLike();
                },
                color: Colors.red, // Set the color of the like icon
                iconSize: 36, // Set the size of the like icon
              ))
        ],
      ),
      ),
    );
  }
}

class FourthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fourth')),
      body:
      Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/images/Federer.jpg', height: 300),
          SizedBox(height: 16.0),
          Text('Rodger Federer is a goat in Tennis for me. I was used to watch every match of him', style: TextStyle(fontSize: 24.0)),
          SizedBox(height: 16.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green, // Set the button color to blue
            ),
            onPressed: () async {
              final result = await Navigator.pushNamed(context, '/fifth', arguments: 'Hello from Fourth!');
              if (result != null) {
                Navigator.pop(context, 'Received: $result');
              }
            },
            child: Text('Go to the Fifth Screen'),
          ),
        Consumer<AppData>(
          builder: (context, appData, _) => IconButton(
            icon: appData.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
            onPressed: () {
              appData.toggleLike();
            },
            color: Colors.red, // Set the color of the like icon
            iconSize: 36, // Set the size of the like icon
          )),
        ],
      ),
      ),
    );
  }
}

class FifthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fifth')),
      body:
      Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('lib/images/ronaldinho.png', height: 500, width: 400),
          Text('We back to the football. Even though my idol is Ronaldu I really appreciate and respect Ronaldinho. Because he is accually magician in football', style: TextStyle(fontSize: 20.0)),
          SizedBox(height: 8.0),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black26, // Set the button color to blue
            ),
            onPressed: () {
              // Example of using Provider to update app-wide state
              Provider.of<AppData>(context, listen: false).setMessage('Hello from Fifth!');
              Navigator.pop(context, 'Result from Fifth Screen');
            },
            child: Text('Send Result and Go Back'),
          ),
          Consumer<AppData>(
              builder: (context, appData, _) => IconButton(
                icon: appData.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                onPressed: () {
                  appData.toggleLike();
                },
                color: Colors.red, // Set the color of the like icon
                iconSize: 36, // Set the size of the like icon
              ))
        ],
      ),
      ),
    );
  }
}
