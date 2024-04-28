import 'package:flutter/material.dart';

class DetailAvatar extends StatelessWidget {
  final Color primaryColor;
  final String image;
  final double size;
  final double transitionBorderwidth;

  const DetailAvatar(
      {Key? key,
      required String this.image,
      this.primaryColor = Colors.deepPurpleAccent,
      this.size = 190.0,
      this.transitionBorderwidth = 20.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Container(
            child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: primaryColor.withOpacity(0.05)),
        )),
        Container(
          child: Container(
              height: size - transitionBorderwidth,
              width: size - transitionBorderwidth,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    stops: [0.01, 0.5],
                    colors: [Colors.white, primaryColor.withOpacity(0.1)]),
              )),
        ),
        Container(
          child: Container(
              height: size - (transitionBorderwidth * 2),
              width: size - (transitionBorderwidth * 2),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withOpacity(0.4))),
        ),
        Container(
          child: Container(
              height: size - (transitionBorderwidth * 3),
              width: size - (transitionBorderwidth * 3),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor.withOpacity(0.5))),
        ),
        Container(
            child: Container(
                height: size - (transitionBorderwidth * 4),
                width: size - (transitionBorderwidth * 4),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(image)))))
      ],
    );
  }
}
