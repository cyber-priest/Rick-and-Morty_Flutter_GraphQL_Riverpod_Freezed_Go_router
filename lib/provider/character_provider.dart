import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shewaber/models/character.dart';
import 'package:shewaber/services/api_service.dart';

final characterProvider =
    FutureProvider.autoDispose<List<Character>>((ref) async {
  final client = ApiServices.charactersToQuery();
  final QueryOptions options = QueryOptions(
    document: gql(
      '''
        query {
          characters{
            results{
              id
              name
              image
              status
            }
          }
        }

      ''',
    ),
  );

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    throw result.exception!;
  }
  print(result.data!['characters']['results']);
  return (result.data!['characters']['results'] as List)
      .map((dynamic item) => Character.fromJson(item as Map<String, dynamic>))
      .toList();
});

final searchCharacterProvider =
    FutureProvider.autoDispose<List<Character>>((ref) async {
  final client = ApiServices.charactersToQuery();
  final QueryOptions options = QueryOptions(
    document: gql(
      '''
        query GetCharacters(\$name: String){
          characters(filter: { name: \$name }){
            results{
              id
              name
              image
              status
            }
          }
        }

      ''',
    ),
    variables: {'name': ref.watch(searchTextProvider.notifier).state},
  );

  final QueryResult result = await client.query(options);

  if (result.hasException) {
    throw result.exception!;
  }
  print(result.data!['characters']['results']);
  return (result.data!['characters']['results'] as List)
      .map((dynamic item) => Character.fromJson(item as Map<String, dynamic>))
      .toList();
});

final searchTextProvider = StateProvider<String>((ref) => '');
