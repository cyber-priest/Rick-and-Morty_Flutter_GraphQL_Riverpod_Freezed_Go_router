import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shewaber/models/character.dart';
import 'package:shewaber/provider/character_provider.dart';
import 'package:shewaber/provider/favorite_provider.dart';

class Collections extends StatelessWidget {
  Collections({
    Key? key,
    required this.character,
  }) : super(key: key);
  final Character? character;

  final Color color = Colors.deepPurple;
  final Function onTap = () {};
  // final double width = 100;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed("details", extra: character);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                offset: const Offset(10, 20),
                blurRadius: 10,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ],
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 180,
              child: Image(
                image: NetworkImage(character!.image!),
                fit: BoxFit.cover,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                // color: Colors.red
              ),
              clipBehavior: Clip.antiAlias,
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                // width: width,
                child: LikeListTile(
              character: character,
              color: color,
            ))
          ],
        ),
      ),
    );
  }
}

class LikeListTile extends ConsumerWidget {
  LikeListTile({Key? key, required this.character, this.color = Colors.grey})
      : super(key: key);
  final Character? character;

  final Color color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteNotifier = ref.watch(favoriteProvider.notifier);
    bool isLiked = favoriteNotifier.isFavorite(character!);
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: Container(
        width: 50,
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: NetworkImage(character!.image!))),
          ),
        ),
      ),
      title: Text(character!.name!),
      subtitle: Row(
        children: [
          Icon(Icons.adjust, color: Colors.purple, size: 15),
          SizedBox(width: 2),
          Text(character!.status!)
        ],
      ),
      trailing: Container(
          child: IconButton(
        icon: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
            color: color),
        onPressed: () {
          if (!isLiked) {
            favoriteNotifier.addFavorite(character!);
            ref.refresh(characterProvider);
          } else {
            favoriteNotifier.removeFavorite(character!.id!);
            ref.refresh(characterProvider);
          }
        },
      )),
    );
  }
}
