import 'package:appmyjuice/components/my_drawer_tile.dart';
import 'package:appmyjuice/pages/cart_page.dart';
import 'package:appmyjuice/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 100.0,
              bottom: 50,
            ),
            child: ClipOval(
              child: Image.asset(
                'lib/images/logo/logo.jpg',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.tertiary
            ),
          ),

          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),

          MyDrawerTile(
            text: "C A R R I N H O",
            icon: Icons.shopping_cart_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),

          const Spacer(),

          MyDrawerTile(
            text: "${FirebaseAuth.instance.currentUser!.email}",
            icon: Icons.person,
            onTap: () {},
          ),

          MyDrawerTile(
            text: "S A I R",
            icon: Icons.logout,
            onTap: () {
              logout();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 25)
        ],
      ),
    );
  }
}