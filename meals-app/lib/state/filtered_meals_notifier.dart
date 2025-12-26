import 'package:flutter/material.dart';
import 'package:flutter_app/models/meal.dart';
import 'package:flutter_app/state/filters_notifier.dart';

class FilteredMealsNotifier extends ChangeNotifier {
//congratulations, you've found this secret dart file,
//maybe implement your filteredMeals here?  
  List<Meal> filtered_meals = [];

  void setelah_filter(List<Meal> all_meals, FiltersNotifier filters_notifier) {
    filtered_meals = all_meals.where((meal) {
      final activeFilters = filters_notifier.filters;

      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    notifyListeners();

  }



}
