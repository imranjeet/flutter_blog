import '../config/constant.dart';
import '../models/blog_post.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_html/flutter_html.dart';


class BlogPostDetails extends StatefulWidget {
  final BlogPost blogPost;
  BlogPostDetails({this.blogPost});

  @override
  _BlogPostDetailsState createState() => _BlogPostDetailsState();
}

class _BlogPostDetailsState extends State<BlogPostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.blogPost.title),
      ),
      body: ListView(
        children: <Widget>[
          Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(this.widget.blogPost.featuredImageUrl),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this.widget.blogPost.title, style: kHeadingTextStyle,),
              ),
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  DateFormat.yMMMd()
                      .format(DateTime.parse(this.widget.blogPost.createdAt)),
                  style: kSubTextStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Html(data: this.widget.blogPost.details),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
