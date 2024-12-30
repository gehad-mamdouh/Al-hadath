import 'package:flutter/material.dart';
import '../../app_colors.dart';
import '../../models/SourceResponse.dart';
import '../../models/api_manger.dart';
import '../../models/newsResponse.dart';
import '../news/news_item.dart';

class NewsWidget extends StatefulWidget {
  Source source ;
  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManger.getNewsBySourceId(widget.source.id??""),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primarylightColor,
              ),
            );
          }else if(snapshot.hasError){
            return Column(
              children: [
                const Text('Something went wrong',style:TextStyle(fontSize: 20) ,),
                ElevatedButton(onPressed: (){
                  ApiManger.getNewsBySourceId(widget.source.id??'');
                  setState(() {

                  });
                }, child: const Text('Try again'))
              ],
            );
          }
          // server => success , error
          if(snapshot.data!.status != 'ok'){
            return Column(
              children: [
                Text(snapshot.data!.message!),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // اللون الخلفي للزر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12), // زوايا مدورة
                    ),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30), // تعديل المسافات داخل الزر
                    elevation: 5, // الظل
                  ),
                  onPressed: () {
                    ApiManger.getNewsBySourceId(widget.source.id ?? '');
                    setState(() {});
                  },
                  child: const Text(
                    'Try again',
                    style: TextStyle(
                      fontSize: 18, // حجم النص
                      fontWeight: FontWeight.bold, // سمك النص
                      color: Colors.white, // اللون النص
                    ),
                  ),
                )
              ],
            );
          }
          var newsList = snapshot.data!.articles! ;
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index]);
          },
            itemCount: newsList.length,);
        }
    );
  }
}