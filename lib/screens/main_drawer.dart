import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Header của Drawer
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 18),
                Text(
                  'Cooking up',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ],
            ),
          ),
          // Item cho Meals
          _buildListTile(
            context: context,
            icon: Icons.restaurant,
            title: 'Meals',
            identifier: 'meals',
          ),
          // Item cho Filters
          _buildListTile(
            context: context,
            icon: Icons.settings,
            title: 'Filters',
            identifier: 'filters',
          ),
        ],
      ),
    );
  }

  // Widget helper để tạo ListTile
  ListTile _buildListTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String identifier,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
        color: Theme.of(context).colorScheme.primary,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
              fontSize: 24,
            ),
      ),
      onTap: () {
        onSelectScreen(identifier);
      },
    );
  }
}
