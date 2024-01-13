import 'package:flutter/material.dart';
import 'package:test_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Picker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

/*

Hello Guys in this video we are going to see how to make an RailNavigation like we see in 
Flipkart Categories Section

The screenshot of the flipkart app category section

Let's see how to create that one

To make it I have create a some List of items which have the category image url and the category names
List wise

You can copy the whole code from the link given in the description

Now let's start our creating

*/
