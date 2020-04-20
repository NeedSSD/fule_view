import 'package:flutter/material.dart';
import 'package:fule_view/fule_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String msg = '在Stack布局中，会正好为子组件的大小';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FuleView'),
        ),
        body: ListView(
          children: <Widget>[
            FuleView(
              child: Text('你好 我是最简单的FuleView'),
            ),
            FuleView(
              backgroundColor: Colors.grey[500],
              margin: [10],
              child: Text('margin和padding的类型为 List<double>'),
            ),
            FuleView(
              margin: [15, 10],
              padding: [0, 10, 15],
              backgroundColor: Colors.yellow,
              child: Text('顺序为上右下左，就像CSS里那样'),
            ),
            FuleView(
              child: Text('可以快速地做出按钮效果👇'),
            ),
            Stack(
              children: <Widget>[
                FuleView(
                  backgroundColor: Colors.greenAccent,
                  margin: [5],
                  padding: [10],
                  borderRadiusWidth: 20,
                  boxShadowColor: Colors.green[100],
                  boxShadowBlurRadius: 4,
                  boxShadowSpreadRadius: 1,
                  child: Text(msg),
                  onTap: () {
                    print('onTap');
                    setState(() {
                      msg = '现在只支持监听onTap';
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
