import 'package:flutter/material.dart';

Color color = Color(0xff59c2ff);

class BottomBar extends StatefulWidget {
  final Function(int index) onChangeActiveTab;
  final int activeIndex;

  const BottomBar({Key key, this.onChangeActiveTab, this.activeIndex = 0})
    : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _activeIndex;

  @override
  void initState() {
    super.initState();
    _activeIndex = widget.activeIndex;
  }

  @override
  Widget build(BuildContext context){
    return Container(
      height: 70,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  _getBottomBarItem(
                    context: context,
                    index: 0,
                    icon: Icons.home,
                  ),
                  _getBottomBarItem(
                    context: context,
                    index: 1,
                    icon: Icons.home,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 5
                  ),
                  _getBottomBarItem(
                    context: context,
                    index: 2,
                    icon: Icons.home,
                  ),
                  _getBottomBarItem(
                    context: context,
                    index: 3,
                    icon: Icons.home,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.center,
              child: FloatingActionButton(
                heroTag: 'btn',
                elevation: 2,
                highlightElevation: 5,
                backgroundColor: color,
                child: Icon(
                  Icons.add,
                  size: 38,
                ),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getBottomBarItem({BuildContext context, int index, IconData icon}){
    double itemWidth = MediaQuery.of(context).size.width / 5;
    double iconSize = 35.0;
    return new Container(
      width: itemWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              size: iconSize,
              color: _getItemColor(index: index),
            ),
            onPressed: () {
              if (index != _activeIndex) {
                setState(() {
                  _activeIndex = index;
                  widget.onChangeActiveTab(index);
                });
              }
            },
          ),
          Visibility(
            visible: index == _activeIndex,
            child: Container(
              width: 10,
              height: 2,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(10)
              ),
            )
          )
        ],
      ),
    );
  }

  Color _getItemColor({int index}) {
    return index == _activeIndex ? color : Colors.grey[300];
  }
}