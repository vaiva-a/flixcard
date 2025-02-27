import 'package:black_tortoise/models/pages.dart';
import 'package:black_tortoise/models/theme.dart';
import 'package:black_tortoise/routes/pages/games.dart';
import 'package:black_tortoise/routes/pages/movies.dart';
import 'package:black_tortoise/routes/pages/serials.dart';
import 'package:black_tortoise/routes/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class NavBarWidget extends StatefulWidget {
  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget>
    with SingleTickerProviderStateMixin {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, model, child) {
      return BottomNavigationBar(
        fixedColor: model.accentColor,
        currentIndex: currentIndex,
        unselectedItemColor:
            model.type == ThemeType.dark ? Colors.black : Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.games_outlined),
            label: 'Games',
            backgroundColor: model.globalColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: 'Movies',
            backgroundColor: model.globalColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.laptop_chromebook_outlined),
            label: 'Serials',
            backgroundColor: model.globalColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
            backgroundColor: model.globalColor,
          ),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
          Provider.of<PageModel>(context, listen: false).changePage(index);
        },
      );
    });
  }
}
