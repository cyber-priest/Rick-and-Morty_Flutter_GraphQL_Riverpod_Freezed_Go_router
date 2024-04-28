import 'package:flutter/material.dart';

class DetailTitle extends StatelessWidget {
  final String subtitle;
  final String title;
  const DetailTitle({required this.subtitle, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold)),
        SizedBox(
          height: 10,
        ),
        Text(subtitle,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.normal)),
      ],
    );
  }
}
