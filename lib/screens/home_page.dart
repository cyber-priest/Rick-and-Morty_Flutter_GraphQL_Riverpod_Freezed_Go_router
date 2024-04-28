import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shewaber/models/character.dart';
import 'package:shewaber/provider/character_provider.dart';
import 'package:shewaber/widgets/collections.dart';
import 'package:shewaber/widgets/title_bar.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterValue = ref.watch(characterProvider);

    return Column(
      children: [
        TitleBar(
          title: "Rick and Morty",
          subtitle: "This collections using GraphQL",
          color: Colors.purple,
        ),
        Expanded(
          child: characterValue.when(
              data: (List<Character> char) => ListView.builder(
                    itemCount: char.length,
                    itemBuilder: (_, index) => ListTile(
                      title: Collections(character: char[index]),
                    ),
                  ),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error, _) => Text(error.toString())),
        ),
      ],
    );
  }
}
