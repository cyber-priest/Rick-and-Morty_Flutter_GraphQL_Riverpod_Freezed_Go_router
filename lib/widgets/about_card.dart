import 'package:flutter/material.dart';

class AboutCard extends StatelessWidget {
  const AboutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://cdn.codersociety.com/uploads/graphql-reasons.png"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
              colors: [Colors.white, Colors.purpleAccent])),
      child: Stack(
        children: [
          Opacity(
            opacity: .5,
            child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/flutterbricks-public.appspot.com/o/BACKGROUND%202.png?alt=media&token=0d003860-ba2f-4782-a5ee-5d5684cdc244",
                fit: BoxFit.cover),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                "Made using GraphQL",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
