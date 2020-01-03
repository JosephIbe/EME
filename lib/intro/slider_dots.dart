import 'package:flutter/material.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class Dots extends StatelessWidget {
  final IndexController controller;
  final int slideIndex;
  final int numberOfDots;

  Dots({this.controller, this.slideIndex, this.numberOfDots});

  Widget _activeSlide(int index) {
    return GestureDetector(
      onTap: () {
        print('Tapped');
        // controller.move(index);
      },
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0, right: 8.0),
          child: Container(
            width: 20.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: Colors.orangeAccent.withOpacity(.3),
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inactiveSlide(int index) {
    return GestureDetector(
      onTap: () {
        controller.move(index);
      },
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(left: 5.0, right: 5.0),
          child: Container(
            width: 14.0,
            height: 14.0,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.7),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
      ),
    );
  }

  List<Widget> _generateDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == slideIndex ? _activeSlide(i) : _inactiveSlide(i));
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _generateDots(),
        ));
  }
}

//class SliderDots extends StatelessWidget {
//  final IndexController indexController;
//  final int slideIndex;
//  final int numDots;
//
//  SliderDots({this.indexController, this.slideIndex, this.numDots});
//
//  List<Widget> generateSliderDots() {
//    List<Widget> dots = [];
//    for (int i = 0; i < numDots; i++) {
//      dots.add(i == slideIndex ? activeSlide(i) : inActiveSlide(i));
//    }
//    return dots;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Center(
//      child: Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: generateSliderDots()),
//    );
//  }
//
//  Widget activeSlide(int index) {
//    return GestureDetector(
////      onTap: navigateSlide(index),
//      onTap: () {
//        print('tapped');
//      },
//      child: Container(
//        child: Padding(
//          padding: EdgeInsets.only(left: 8.0, right: 8.0),
//          child: Container(
//            height: 20.0,
//            width: 20.0,
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(50.0),
//                color: Colors.orangeAccent.withOpacity(0.3)),
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget inActiveSlide(int index) {
//    return GestureDetector(
//      onTap: navigateSlide(index),
//      child: Container(
//        child: Padding(
//          padding: EdgeInsets.only(left: 5.0, right: 5.0),
//          child: Container(
//            width: 14.0,
//            height: 14.0,
//            decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(50.0),
//                color: Colors.black12),
//          ),
//        ),
//      ),
//    );
//  }
//
//  navigateSlide(int index) {
//    indexController.move(index);
//  }
//}
