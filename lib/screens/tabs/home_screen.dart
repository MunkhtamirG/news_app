import 'package:flutter/material.dart';
import 'package:news_app/widgets/headline_slider.dart';
import 'package:news_app/widgets/hot_news.dart';
import 'package:news_app/widgets/top_channels.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HeadlingSliderWidget(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Top channels',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        TopChannelsWidget(),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            'Hot News',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),
        HotNewsWidget(),
      ],
    );
  }
}
