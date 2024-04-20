import 'package:flutter/material.dart';
import 'package:news_app/core/models/category_model.dart';
import 'package:news_app/screens/category_screen/view_model/categories_view_model.dart';
import 'package:news_app/screens/category_screen/widgets/sourcelist_widget.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryScreen({super.key, required this.categoryModel});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  var vm = CategoryViewModel();

  @override
  void initState() {
    vm.getNewsDataSource(widget.categoryModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => vm,
      child: Consumer<CategoryViewModel>(
        builder: (context, value, child) {
          if (vm.sourcesList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SourceListWidget(sourceList: vm.sourcesList);
          }
        },
      ),
    );

    ////// calling Api using FutureBuilder
    //     child: FutureBuilder(
    //   future: ApiManager.fetchData(widget.categoryModel.id),
    //   builder: (context, snapshot) {
    //     if (snapshot.hasError) {
    //       return const Center(
    //         child: Text("Something went wrong"),
    //       );
    //     }
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const Center(child: CircularProgressIndicator());
    //     }
    //     var sourcesList = snapshot.data ?? [];
    //     return SourceListWidget(sourceList: sourcesList);
    //   },
    // )
  }
}
