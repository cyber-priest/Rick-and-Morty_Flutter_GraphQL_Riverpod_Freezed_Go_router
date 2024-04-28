import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shewaber/provider/favorite_provider.dart';
import 'package:shewaber/widgets/collections.dart';
import 'package:shewaber/widgets/title_bar.dart';

class FavoritePage extends ConsumerWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteProvider);

    return Column(
      children: [
        TitleBar(
          title: "Favorites",
          subtitle: "Rick and morty",
          color: Colors.purple,
        ),
        Expanded(
          child: ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (_, index) => ListTile(
              title: Collections(character: favorites[index]),
            ),
          ),
        ),
      ],
    );
  }
}
