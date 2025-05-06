import 'package:e_commerce/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),
              MyListTile(
                text: "S H O P",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),

              MyListTile(
                text: "C A R T",
                icon: Icons.shopping_cart,
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          const SizedBox(height: 25),

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "E X I T",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                context, 'intro_page', (route) => false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
