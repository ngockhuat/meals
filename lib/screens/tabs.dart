import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/providers/filters_provider.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/main_drawer.dart';
import 'package:meals/screens/meals.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false
};

class TabsScreen extends ConsumerStatefulWidget {
  // goi cung cap boi rivepod
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;
  // final List<Meal> _favoriteMeal = [];
  // ignore: prefer_final_fields
  // Map<Filter, bool> _selectFilters = kInitialFilters;

  // void _showInfoMessage(String message) {
  //   ScaffoldMessenger.of(context).clearSnackBars();
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  // void _toggleMealFavoriteStatus(Meal meal) {
  //   final isExisting = _favoriteMeal.contains(meal);
  //   if (isExisting == true) {
  //     setState(() {
  //       _favoriteMeal.remove(meal);
  //     });
  //     _showInfoMessage('Meal is no longer  a favorite.');
  //   } else {
  //     setState(() {
  //       _favoriteMeal.add(meal);
  //     });
  //     _showInfoMessage('Maked as a favorite');
  //   }
  // }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

// dieu huong va luu ow ben filter
  void _setScreen(String identifiler) async {
    Navigator.of(context).pop();
    if (identifiler == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => FiltersScreen()));
      // setState(() {
      //   _selectFilters = result ?? kInitialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals =ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availabelMeals: availableMeals,
    );
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoriteMealsProvider);

      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
