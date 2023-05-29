import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piro',
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
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'Piro'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = ConfettiController();
  bool isPlaying = false;

  int _counterKK = 0;
  int voter=366;
  int participationrate=100;

  @override
  void initState() {
    super.initState();
    controller.play();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }
   void _participationRate() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _totalVote();
      participationrate= (_total*100/voter).round();


      _remainingVote();
      if ( _counterKK == 212) {
        controller.play();
        isPlaying = true;
      } else{
        controller.stop();
        isPlaying = false;
      }
    });
  }

  void _incrementCounterKK() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counterKK++;
      _totalVote();
      _remainingVote();
      _participationRate();
      if ( _counterKK == 212) {
        controller.play();
        isPlaying = true;
      } else{
        controller.stop();
        isPlaying = false;
      }
    });
  }

  int _kkres = 0;

  void _kKRes() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _incrementCounterKK();
      _kkres = _counterKK + _subtractionkk;
      _totalVote();
    });
  }

  int _subtractionkk = 0;

  void _subtractionKK() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _subtractionkk--;
      _totalVote();
    });
  }
  int _remainingvote=0;
  void _remainingVote() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _remainingvote= voter-_total;
      
    });
  }

  int _invalidvote = 0;

  void _invalidVote() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _invalidvote++;
      _totalVote();
      _remainingVote();
      _participationRate();
    });
  }

  int _emptyvote = 0;

  void _emptyVote() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _emptyvote++;
      _totalVote();
      _remainingVote();
      _participationRate();
    });
  }

  int _counterD = 0;

  void _incrementCounterD() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counterD++;
      _totalVote();
      _remainingVote();
      _participationRate();
    });
  }

  int _total = 0;
  void _totalVote() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _total = _counterD + _counterKK + _invalidvote + _emptyvote;
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
    var width2 = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            isPlaying == false
                ? SizedBox()
                : ConfettiWidget(
                  emissionFrequency: 0.05,
                  numberOfParticles: 100,
                    blastDirection: pi / 2, confettiController: controller),
                    Text("Katılım Oranı:  %$participationrate"),
                    SizedBox(
                      height: 5,
                    ),
                    Text("Seçmen Sayısı:  $voter"),
            Container(
              width: width2,
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey, width: 1)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: _incrementCounterD,
                    child: Container(
                      width: width2 * 0.4,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100.0,
                            width: width2 * 0.4,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/user.avif'),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Diğer Aday",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.transparent,
                            foregroundColor: Colors.black87,
                            child: Text(
                              '$_counterD',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 25),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  _buildKKCard(width2),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _invalidVote,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white10)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Geçersiz Oy",
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                  ),
                ),
                Text(' :$_invalidvote',
                    style: Theme.of(context).textTheme.headlineMedium)
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: _emptyVote,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white10)),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Boş Oy",
                          style: TextStyle(fontSize: 30, color: Colors.white)),
                    ),
                  ),
                ),
                Text(' :$_emptyvote',
                    style: Theme.of(context).textTheme.headlineMedium)
              ],
            ),
            _buildOyTaplami(context),
            Text("Kullanılmayan Oy: $_remainingvote ")
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Text _display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }

  Row _buildOyTaplami(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Toplam  Oy: ',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: Colors.green),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$_total',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildKKCard(double width2) {
    return InkWell(
      // onDoubleTap: _subtractionKK,
      onTap: _incrementCounterKK,
      child: Container(
        width: width2 * 0.4,
        height: 250,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100.0,
              width: width2 * 0.4,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/kk.png'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Kemal Kılıçdaroğlu",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black87,
              child: Text(
                '$_counterKK',
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
