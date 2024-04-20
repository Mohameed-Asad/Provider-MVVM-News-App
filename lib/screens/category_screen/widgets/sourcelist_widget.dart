import 'package:flutter/material.dart';
import 'package:news_app/core/models/source_model.dart';
import 'package:news_app/screens/category_screen/view_model/article_view_model.dart';
import 'package:news_app/screens/category_screen/widgets/tabbar_model.dart';
import 'package:provider/provider.dart';

import '../../../core/config/constants.dart';
import 'article_widget.dart';

class SourceListWidget extends StatefulWidget {
  final List<SourceModel> sourceList;

  const SourceListWidget({super.key, required this.sourceList});

  @override
  State<SourceListWidget> createState() => _SourceListWidgetState();
}

class _SourceListWidgetState extends State<SourceListWidget> {
  int currentIndex = 0;
  var vm = ArticlesViewModel();

  @override
  void initState() {
    vm.getNewsArticles(widget.sourceList[currentIndex].id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            initialIndex: currentIndex,
            length: widget.sourceList.length,
            child: TabBar(
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                    vm.getNewsArticles(widget.sourceList[currentIndex].id);
                  });
                },
                isScrollable: true,
                padding: const EdgeInsets.all(10),
                dividerColor: Colors.transparent,
                indicator: const BoxDecoration(),
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                tabAlignment: TabAlignment.start,
                tabs: widget.sourceList
                    .map((e) => TabModel(
                          sourceModel: e,
                          isClicked:
                              currentIndex == widget.sourceList.indexOf(e),
                        ))
                    .toList())),
        ChangeNotifierProvider(
          create: (context) => vm,
          child: Consumer<ArticlesViewModel>(
            builder: (context, vm, child) {
              if (vm.articlesList.isEmpty) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Constants.theme.primaryColor,
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => ArticleItemWidget(
                      articleDataModel: vm.articlesList[index]),
                  itemCount: vm.articlesList.length,
                ),
              );
            },
          ),
        )

        ////////////////// Using FutureBuilder
        // FutureBuilder(
        // future:
        // ApiManager.fetchDataSources(widget.sourceList[currentIndex].id),
        // builder: (context, snapshot) {
        // if (snapshot.hasError) {
        // return Center(
        // child: Text(
        // "Error fetching articles",
        // style: Constants.theme.textTheme.bodyLarge?.copyWith(
        // color: Colors.black,
        // ),
        // ),
        // );
        // }
        // if (snapshot.connectionState == ConnectionState.waiting) {
        // return Center(
        // child: CircularProgressIndicator(
        // color: Constants.theme.primaryColor,
        // ),
        // );
        // }
        // List<ArticleDataModel> articlesList = snapshot.data ?? [];
      ],
    );
  }
}
