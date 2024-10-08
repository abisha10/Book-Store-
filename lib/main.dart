import 'package:bookstore/firebase_options.dart';
import 'package:bookstore/models/store.dart';
import 'package:bookstore/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookstore/services/auth/auth_gate.dart';



void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
       MultiProvider(providers:[
         //theme provider
         ChangeNotifierProvider(create: (context) => ThemeProvider()),

         //store provider
         ChangeNotifierProvider(create: (context) => Store()),
        ],
        child: const MyApp(),
       ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

