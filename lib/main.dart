import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _items = [0, 1, 2, 3];

  void removeItem(int i) {
    setState(() {
      _items.removeWhere((x) => x == i);
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = _items.map((i) => _openContainer(i)).toList();

    return Scaffold(
        body: ListView(
            children:
                items) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Widget _openContainer(int i) {
    return OpenContainer(
      // DevTool WidgetInspector told that this is not transparent
      closedColor: Colors.transparent,
      transitionType: ContainerTransitionType.fade,
      openBuilder: (_, closeContainer) {
        return _ItemDetail(i, this, closeContainer);
      },
      closedBuilder: (_, openContainerCallback) {
        return ListTile(title: Text('Item $i'), onTap: openContainerCallback);
      },
    );
  }
}

class _ItemDetail extends StatelessWidget {
  const _ItemDetail(this._itemId, this._parentState, this.closeContainer);

  final int _itemId;
  final _MyHomePageState _parentState;
  final VoidCallback closeContainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('Item $_itemId'),
              RaisedButton(
                  child: Text('Delete'),
                  onPressed: () {
                    _parentState.removeItem(_itemId);
                    closeContainer();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
