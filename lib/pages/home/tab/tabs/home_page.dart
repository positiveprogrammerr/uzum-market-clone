import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:uzum_clone/components/constants/image.dart';
import 'package:uzum_clone/components/constants/mediaquares.dart';
import 'package:uzum_clone/data/api_services/product_service.dart';
import 'package:uzum_clone/data/models/product_model.dart';
import 'package:uzum_clone/pages/home/tab/tabs/widgets/each_widget.dart';

import 'widgets/page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: m_h(context) * 0.285,
            width: m_w(context).toDouble(),
            child: PageView(
              children: [
                PageViewWidget(
                  image: AppImages.pv_1,
                ),
                PageViewWidget(
                  image: AppImages.pv_2,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              child: Column(
                children: const [
                   TabBar(
                    labelStyle: TextStyle(color: Colors.black),
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    tabs: [
                      Tab(
                        child: Text(
                          'Barakali Juma',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Mashhur',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Yangi',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        EachTab(category: "electronics" ),
                        EachTab(category: "jewelery"),
                        EachTab(category: "men's clothing"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


 