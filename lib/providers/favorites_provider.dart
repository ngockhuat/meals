import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]); // ban dau la 1 chuoi rong
  bool toggleMealFavoriteStatus(Meal meal) {
    final mealIsFavorite = state.contains(meal); // kiem tra trang thai

    if (mealIsFavorite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  // tra ve thong bao mowi
  return FavoriteMealsNotifier();
});
