import 'package:demo_project/redirect.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'dart:async';
void main() { 
  
  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      home: MyApp(),
      theme: ThemeData(
        canvasColor: Colors.black,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: Colors.pinkAccent,
        brightness: Brightness.dark,
      ),
    ));}
class SO extends StatefulWidget

{
   @override
_SOState createState() => _SOState();
}
class _SOState extends State<SO> {
  List<dynamic> currentMessages = [];

  Timer timer;

  @override
  void initState() {
    super.initState();
   int ctr= 0;
    const twoSec = const Duration(seconds: 2);
    timer = new Timer.periodic(twoSec, (Timer t) {
   
      setState(() {
        currentMessages.add(ctr);
        ctr++;
        if(ctr==6)
        {
          t.cancel();   
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: currentMessages.length,
          itemBuilder: (BuildContext context, int index) {
            if (currentMessages.length == 0) return Container();
            return MyApp(
           //  sec: currentMessages[index],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
class MyApp extends StatefulWidget {
 
 


  @override
  MyAppState createState() => MyAppState();
}

 class MyAppState extends State<MyApp> with TickerProviderStateMixin {
 
  AnimationController controller;



  // bool isPlaying = false;

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }



  @override
  void initState() {
    super.initState();
    
       controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
       );
  

    // ..addStatusListener((status) {
    //     if (controller.status == AnimationStatus.dismissed) {
    //       setState(() => isPlaying = false);
    //     }

    //     print(status);
    //   })
  }
  @override

  Widget build(BuildContext context) {
 
  
    // custom code here
  

    
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title : Text('Timer'),
      centerTitle : true),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                                painter: TimerPainter(
                              animation: controller,
                              backgroundColor: Colors.white,
                              color: themeData.indicatorColor,
                            ));
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Count Down",
                              style: themeData.textTheme.subhead,
                            ),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: themeData.textTheme.display4,
                                  );
                                }),
                          ],                       
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return Icon(controller.isAnimating
                            ? Icons.pause
                            : Icons.play_arrow);

                        // Icon(isPlaying
                        // ? Icons.pause
                        // : Icons.play_arrow);
                      },
                    ),
                    onPressed: () {
                      // setState(() => isPlaying = !isPlaying);
                       
                      if (controller.isAnimating) {
                         
                        controller.stop(canceled: true);

                        
                      
                      } else {
                        controller.reverse(
                            from: controller.value == 0.0
                                ? 1.0
                                : controller.value);
                               
                               
                               
                      }
                    
                    },
                  )
                ],
              ),
            )
          ],
        ),
    ),
    );
  }
  }
 
 




class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}