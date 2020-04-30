// https://gist.github.com/collinjackson/4fddbfa2830ea3ac033e34622f278824

import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CommentsView extends StatefulWidget {
  final List<String> comments;

  CommentsView({Key key, @required this.comments}) : super(key: key);

  @override
  State createState() => new CommentsViewState();
}

class CommentsViewState extends State<CommentsView> {
  final _controller = new PageController(viewportFraction: 1);

  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.red.withOpacity(0.8);

  Widget buildComment(BuildContext context, String comment) => Text(
        comment,
        style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            fontFamily: 'Schyler'),
        textAlign: TextAlign.center,
      );

  List<Widget> buildComments(BuildContext context, List<String> comments) {
    var commentCards = <Widget>[];

    comments.forEach((comment) {
      Widget commentCard = Container(
        color: Colors.transparent,
        child: Center(child: buildComment(context, comment)),
      );

      return commentCards.add(commentCard);
    });
    return commentCards;
  }

  List<Widget> _pages = <Widget>[];

  Widget _buildPageItem(BuildContext context, int index) {
    return new Page(page: _pages[index], idx: index);
  }

  @override
  Widget build(BuildContext context) {
    _pages = buildComments(context, widget.comments);
    return new Scaffold(
      backgroundColor: Colors.transparent,
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: Center(
          child: Container(
            height: 300,
            width: 360,
            decoration: BoxDecoration(
              color: null,
            ),
            child: new Stack(
              children: <Widget>[
                Positioned(
                  bottom: 50,
                  child: Container(
                    height: 240,
                    width: 340,
                    child: new PageView.builder(
                      physics: new AlwaysScrollableScrollPhysics(),
                      controller: _controller,
                      itemCount: _pages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildPageItem(context, index % _pages.length);
                      },
                    ),
                  ),
                ),
                new Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: new Container(
                    //color: Colors.grey[800].withOpacity(0.5),
                    padding: const EdgeInsets.all(12.0),
                    child: new Center(
                      child: new DotsIndicator(
                        controller: _controller,
                        itemCount: _pages.length,
                        onPageSelected: (int page) {
                          _controller.animateToPage(
                            page,
                            duration: _kDuration,
                            curve: _kCurve,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// An indicator showing the currently selected page of a PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({
    this.controller,
    this.itemCount,
    this.onPageSelected,
    this.color: Colors.grey,
  }) : super(listenable: controller);

  /// The PageController that this DotsIndicator is representing.
  final PageController controller;

  /// The number of items managed by the PageController
  final int itemCount;

  /// Called when a dot is tapped
  final ValueChanged<int> onPageSelected;

  /// The color of the dots.
  ///
  /// Defaults to `Colors.white`.
  final Color color;

  // The base size of the dots
  static const double _kDotSize = 8.0;

  // The increase in the size of the selected dot
  static const double _kMaxZoom = 2.0;

  // The distance between the center of each dot
  static const double _kDotSpacing = 24.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs(),
      ),
    );
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      // color: Colors.purple,
      width: _kDotSpacing,
      height: _kDotSize * _kMaxZoom,
      child: new Center(
        child: new Material(
          color: Color.fromRGBO(
              color.red, color.green, color.blue, max(selectedness, 0.5)),
          // color: color,
          type: MaterialType.circle,
          child: new Container(
            // color: Colors.teal,
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(
              onTap: () => onPageSelected(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}

class Page extends StatelessWidget {
  final page;
  final idx;

  Page({
    @required this.page,
    @required this.idx,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green,
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            height: 200.0,
            width: 340.0,
            color: Colors.transparent,
            child: new Card(
              child: new Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Container(
                    child: this.page,
                    color: Colors.green[200],
                  ),
                  new Material(
                    type: MaterialType.transparency,
                    child: new InkWell(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
