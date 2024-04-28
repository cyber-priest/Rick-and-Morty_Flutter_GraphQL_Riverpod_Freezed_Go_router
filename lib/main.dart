import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shewaber/models/character.dart';
import 'package:shewaber/provider/screen_state_provider.dart';
import 'package:shewaber/screens/detail_screen.dart';
import 'package:shewaber/screens/favorite_page.dart';
import 'package:shewaber/screens/home_page.dart';
import 'package:shewaber/screens/about_page.dart';
import 'package:shewaber/screens/search_page.dart';

void main() {
  runApp(ProviderScope(child: App()));
}

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return MainScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'details',
          name: "details",
          builder: (BuildContext context, GoRouterState state) {
            return DetailScreen(
              character: state.extra as Character,
            );
          },
        ),
      ],
    ),
  ],
);

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

class MainScreen extends ConsumerWidget {
  MainScreen({Key? key}) : super(key: key);
  List screens = [HomePage(), FavoritePage(), SearchPage(), AboutPage()];
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int _currentIndex = ref.watch(screenStateProvider);
    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          ref.read(screenStateProvider.notifier).changeScreen(index);
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Favorites"),
            selectedColor: Colors.purple,
          ),

          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.purple,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.info_outline),
            title: Text("About"),
            selectedColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
