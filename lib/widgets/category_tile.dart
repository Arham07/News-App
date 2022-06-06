import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/widgets/category_item.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({Key? key, this.category}) : super(key: key);
  final categoryList = CategoryModel.generateCategory();

  final CategoryModel? category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.0,
      child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CategoryItem(
                categoryModel: categoryList[index],
              ),
          separatorBuilder: (_, index) => const SizedBox(
                width: 10.0,
              ),
          itemCount: categoryList.length),
    );
  }
}
