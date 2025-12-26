import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:lab08/data/dummy_data.dart';
import 'package:lab08/models/category.dart';
import 'package:lab08/services/navigation.dart';
import 'package:lab08/widgets/category_grid_item.dart';

class HomeCategoriesTab extends StatefulWidget {
  const HomeCategoriesTab({super.key});

  @override
  State<HomeCategoriesTab> createState() => _HomeCategoriesTabState();
}

class _HomeCategoriesTabState extends State<HomeCategoriesTab>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _animationController.forward();
  }

/*bool _hasAnimated = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasAnimated) {
      _animationController.forward(from: 0);
      _hasAnimated = true;
    }
  }*/

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final nav = Provider.of<NavigationService>(context, listen: false);
    nav.goMealsOnCategory(categoryId: category.id);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: dummyCategories.length,
      itemBuilder: (context, index) {
        final category = dummyCategories.values.elementAt(index);
        final rowIndex = (index / 2).floor();
        final delay = 0.2 * rowIndex; // 0.2 seconds per row
        final start = delay;
        final end = (start + 0.5).clamp(0.0, 1.0); // 0.5 sec duration per item, overlapping

        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 2),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(
                  parent: _animationController,
                  curve: Interval(
                    start,
                    end,
                    curve: Curves.ease,
                  ),
                ),
              ),
              child: CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              ),
            );
          },
        );
      },
    );
  }
}

