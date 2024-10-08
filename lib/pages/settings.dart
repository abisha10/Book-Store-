import 'package:bookstore/themes/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   //20:34
        title: Text("Settings"),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.only(left: 25,top: 10,right: 25),
            padding: EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Dark Mode",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,),
                ),
                CupertinoSwitch(value: Provider.of<ThemeProvider>(context,listen: false).isDarkMode,
                  onChanged: (value) => Provider.of<ThemeProvider>(context,listen: false).toggleTheme(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
