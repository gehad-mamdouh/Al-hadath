import 'package:flutter/material.dart';
import 'package:news_app/models/api_manger.dart';

import '../../app_colors.dart';
import '../../models/Category.dart';
import '../../models/SourceResponse.dart';
import '../../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  Category category ;
  CategoryDetails({required this.category});
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
        future: ApiManger.getSources(widget.category.id),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: AppColors.primarylightColor,
            ));
          }else if(snapshot.hasError){
            return Column(
              children: [
                Text('Something went wrong'),
                ElevatedButton(onPressed: (){
                  ApiManger.getSources(widget.category.id);
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          /// server (response) => success , error
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(onPressed: (){
                  ApiManger.getSources(widget.category.id);
                  setState(() {

                  });
                }, child: Text('Try Again'))
              ],
            );
          }
          /// success
          var sourceList = snapshot.data!.sources! ;
          return TabWidget(sourcesList: sourceList,);
        }
    );
  }
}