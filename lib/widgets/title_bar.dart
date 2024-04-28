import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  TitleBar({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.color,
  }) : super(key: key);
  final String? title;
  final String? subtitle;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              offset: const Offset(3, 0),
              blurRadius: 22,
              spreadRadius: 0,
              color: Color.fromARGB(255, 122, 122, 122).withOpacity(.25)),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  subtitle!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  offset: const Offset(12, 26),
                  blurRadius: 50,
                  spreadRadius: 0,
                  color: Colors.grey.withOpacity(.25)),
            ]),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: color,
              child: Icon(
                Icons.icecream,
                size: 25,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
