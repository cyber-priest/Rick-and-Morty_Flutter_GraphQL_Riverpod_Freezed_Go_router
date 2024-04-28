import 'package:graphql_flutter/graphql_flutter.dart';

class ApiServices {
  static HttpLink httpLink = HttpLink(
    'https://rickandmortyapi.com/graphql',
  );

  static GraphQLClient charactersToQuery() {
    return GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );
  }
}
