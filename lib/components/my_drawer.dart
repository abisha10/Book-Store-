import 'package:flutter/material.dart';
import 'package:bookstore/components/my_drawer_tile.dart';
import 'package:bookstore/services/auth/auth_service.dart';
class MyDrawer extends StatelessWidget {
   const MyDrawer({super.key});
   void logout() {
     final authService = AuthService();
     authService.signOut();
   }

   @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey[300],
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Colors.grey[800],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child:  Divider(
              color: Colors.grey,
            ),
          ),
          //home list tile
          MyDrawerTile(text: "HOME", icon: Icons.home, onTap: () => Navigator.pop(context)),
          /*MyDrawerTile(text: "SETTINGS", icon: Icons.settings, onTap: () {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(),
            ),);
          }),*/
          MyDrawerTile(text: "LOGOUT", icon: Icons.logout, onTap:() {
            logout();
            Navigator.pop(context);
          },
          ),
          SizedBox(height: 25,),
          //18.30
        ],
      ),
    );
  }
}
