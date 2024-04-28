import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shewaber/models/character.dart';
import 'package:shewaber/widgets/detail_avatar.dart';
import 'package:shewaber/widgets/detail_title.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.character}) : super(key: key);
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:
                  NetworkImage("https://mfiles.alphacoders.com/905/905397.jpg"),
              fit: BoxFit.cover),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            DetailAvatar(image: character.image!),
            SizedBox(
              height: 20,
            ),
            DetailTitle(
              title: character.name!,
              subtitle: character.status!,
            ),
            SizedBox(
              height: 140,
            ),
            // DetailButton(
            //   character: character,
            // )
          ],
        ),
      ),
    );
  }
}
