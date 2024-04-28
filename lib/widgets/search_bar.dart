import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shewaber/provider/character_provider.dart';

class SearchBar extends ConsumerWidget {
  final TextEditingController textController;
  final String hintText;
  const SearchBar(
      {required this.textController, required this.hintText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(12, 26),
            blurRadius: 50,
            spreadRadius: 0,
            color: Colors.grey.withOpacity(.1)),
      ]),
      child: TextField(
        controller: textController,
        onChanged: (value) {
          ref.read(searchTextProvider.notifier).state = value;
          ref.refresh(searchCharacterProvider.future);
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey[500]!,
          ),
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
              color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w300),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300]!, width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(45.0)),
          ),
        ),
      ),
    );
  }
}
