import 'package:flutter/material.dart';
import 'package:my_eme/intro/slider_dots.dart';
import 'package:my_eme/utils/constants.dart';
import 'package:transformer_page_view/transformer_page_view.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  int slideIndex = 0;
  final IndexController ctrlr = IndexController();
  List<String> images = [
    'assets/images/ob_slide_one.png',
    'assets/images/ob_slide_two.png',
    'assets/images/ob_slide_three.png',
  ];

  @override
  Widget build(BuildContext context) {
    TransformerPageView pageView = TransformerPageView(
      itemCount: images.length,
      loop: false,
      pageSnapping: true,
      controller: ctrlr,
      onPageChanged: (position) {
        setState(() => this.slideIndex = position);
      },
      transformer:
          PageTransformerBuilder(builder: (Widget child, TransformInfo info) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ParallaxContainer(
                      child: Image.asset(
                        images[info.index],
                        fit: BoxFit.cover,
                      ),
                      position: info.position),
                  ParallaxContainer(
                    position: info.position,
                    translationFactor: 500.0,
                    child: Dots(
                      controller: ctrlr,
                      numberOfDots: images.length,
                      slideIndex: slideIndex,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0, top: 30.0),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: slideIndex == 2
                          ? RaisedButton(
                        elevation: 2.0,
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, loginRoute);
                        },
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                        color: Colors.black,
                        textColor: Colors.white,
                        child: Text(introBtnGetStarted),
                      )
                          : Container(),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }),
    );
    return Scaffold(
      backgroundColor: Color(0xFFfafafa),
      body: pageView,
    );
  }
}
