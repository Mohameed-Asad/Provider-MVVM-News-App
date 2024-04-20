import 'package:flutter/material.dart';
import 'package:news_app/core/config/constants.dart';
import 'package:news_app/core/widgets/background_widget.dart';
import 'package:news_app/main.dart';
import 'package:news_app/screens/category_screen/pages/category_screen.dart';
import 'package:news_app/screens/home_screen/widgets/category_item.dart';
import 'package:news_app/screens/home_screen/widgets/drawer_widget/drawer.dart';

import '../../../core/models/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categoriesList = [
    CategoryModel(
      id: "sports",
      title: "Sports",
      imagePath: "assets/images/sports_icn.png",
      bgColor: const Color(0xFFC91C22),
    ),
    CategoryModel(
      id: "general",
      title: "Politics",
      imagePath: "assets/images/politics_icn.png",
      bgColor: const Color(0xFF003E90),
    ),
    CategoryModel(
      id: "health",
      title: "Health",
      imagePath: "assets/images/health_icn.png",
      bgColor: const Color(0xFFED1E79),
    ),
    CategoryModel(
      id: "business",
      title: "Business",
      imagePath: "assets/images/business_icn.png",
      bgColor: const Color(0xFFCF7E48),
    ),
    CategoryModel(
      id: "environment",
      title: "Environment",
      imagePath: "assets/images/environment_icn.png",
      bgColor: const Color(0xFF4882CF),
    ),
    CategoryModel(
      id: "science",
      title: "Science",
      imagePath: "assets/images/science_icn.png",
      bgColor: const Color(0xFFF2D352),
    ),
  ];

  CategoryModel? selectedModel;

  @override
  Widget build(BuildContext context) {
    return BackGroundWidget(
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(selectedModel == null ? "News App" : selectedModel!.title),
          leadingWidth: 80,
        ),
        drawer: CustomDrawer(
          onClick: onCategoriesClick,
        ),
        body: selectedModel == null
            ? Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 35, right: 35, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pick your category\nof interest",
                      style: Constants.theme.textTheme.titleLarge
                          ?.copyWith(color: Colors.black54, height: 1.4),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 18,
                                mainAxisSpacing: 17,
                                childAspectRatio: 1 / 1.15),
                        itemBuilder: (context, index) => CategoryItem(
                          categoryModel: categoriesList[index],
                          currentIndex: index,
                          onCategoryClick: onClick,
                        ),
                        itemCount: 6,
                      ),
                    )
                  ],
                ),
              )
            : CategoryScreen(
                categoryModel: selectedModel!,
              ),
      ),
    );
  }

  void onClick(CategoryModel model) {
    setState(() {
      selectedModel = model;
    });
  }

  void onCategoriesClick() {
    setState(() {
      selectedModel = null;
      navigatorKey.currentState!.pop();
    });
  }
}
