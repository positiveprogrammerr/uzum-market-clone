import 'package:flutter/material.dart';
import 'package:uzum_clone/components/constants/image.dart';
import 'package:uzum_clone/pages/home/tab/tabs/favs_page.dart';
import 'package:uzum_clone/pages/home/tab/tabs/home_page.dart';
import 'package:uzum_clone/pages/home/tab/tabs/search_page.dart';
import 'package:uzum_clone/pages/home/tab/tabs/shopping_basket_page.dart';

import 'tabs/account_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    List pages = const [
      HomePage(),
      SearchPage(),
      ShoppingBasketPage(),
      FavouritesPage(),
      AccountPage(),
    ];
    return Scaffold(
      appBar:AppBar(
  actions: [
    Expanded(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Mahsulot va toifalarni qidirish",
            filled: true,
            fillColor: Colors.grey[300],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
            prefixIcon: const Icon(Icons.search),
          ),
          onSubmitted: (value) {
            // Handle search query submission
          },
        ),
      ),
    ),
  ],
  backgroundColor: Colors.white,
  elevation: 0,
      ),
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentPage,
          onTap: (value) {
            setState(() {
              currentPage = value;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset(
                  AppImages.logo,
                  width: 30,
                  height: 30,
                ),
                label: "Bosh sahifa"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: "Qidiruv"),
            const BottomNavigationBarItem(
                icon:  Icon(Icons.shopping_basket), label: "Savat"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline), label: "Istaklar"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Kabinet"),
          ]),
    );
  }
}
