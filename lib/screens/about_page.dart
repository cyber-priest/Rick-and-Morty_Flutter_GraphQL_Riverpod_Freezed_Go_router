import 'package:flutter/material.dart';
import 'package:shewaber/widgets/about_card.dart';
import 'package:shewaber/widgets/about_tile.dart';
import 'package:shewaber/widgets/title_bar.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          TitleBar(
            title: "About",
            subtitle: "Rick and Morty",
            color: Colors.purple,
          ),
          SizedBox(height: 10),
          AboutCard(),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Packages",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AboutTile(
                text: "Riverpod",
                imageUrl: "https://riverpod.dev/img/logo.png",
                subtitle: "State management",
                onPressed: () {},
              ),
              AboutTile(
                text: "Freezed",
                imageUrl:
                    "https://miro.medium.com/v2/resize:fit:1400/1*smjmrMYhIJMLseXSSgFUAw.png",
                subtitle: "Data modeling ",
                onPressed: () {},
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AboutTile(
                text: "Go Router",
                imageUrl:
                    "https://miro.medium.com/v2/resize:fit:1400/1*VuPLHro1WPuj0WEEgozEsw.png",
                subtitle: "Page navigation",
                onPressed: () {},
              ),
              AboutTile(
                text: "Graphql",
                imageUrl:
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/GraphQL_Logo.svg/1200px-GraphQL_Logo.svg.png",
                subtitle: "Data API ",
                onPressed: () {},
              )
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.5),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(10, 20),
                    blurRadius: 10,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.1)),
              ],
            ),
            child: ListTile(
              dense: true,
              // leading: CircleAvatar(
              //   radius: 20,
              //   child: Icon(
              //     Icons.person,
              //     color: Colors.white,
              //     size: 14,
              //   ),
              //   backgroundColor: Colors.purple,
              // ),
              title: Text("Developed By"),
              subtitle: Text("Mikael Alehegn"),
            ),
          )
        ],
      ),
    );
  }
}
