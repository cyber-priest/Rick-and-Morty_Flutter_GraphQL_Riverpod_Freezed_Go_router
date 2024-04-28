import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shewaber/models/character.dart';
import 'package:shewaber/provider/character_provider.dart';
import 'package:shewaber/widgets/collections.dart';
import 'package:shewaber/widgets/search_bar.dart';
import 'package:shewaber/widgets/title_bar.dart';

class SearchPage extends ConsumerWidget {
  SearchPage({Key? key}) : super(key: key);
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final search = ref.watch(searchCharacterProvider);
    return Column(
      children: [
        TitleBar(
          title: "Search",
          subtitle: "Rick and Morty",
          color: Colors.purple,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SearchBar(
              textController: searchController,
              hintText: "Search for collections..."),
        ),
        Expanded(
          child: search.when(
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
