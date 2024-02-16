import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:s_medi/app/helthnews/newsdetails.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<dynamic> _articles = [];
  bool _isLoading = true;

  Future<void> fetchNews() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://newsapi.org/v2/top-headlines?country=us&category=health&apiKey=d6ff2dcab99a44509c9fdb9ed4cdcbbc'),
      );

      if (response.statusCode == 200) {
        setState(() {
          final articles = jsonDecode(response.body)['articles'];
          _articles = articles
              .where((article) =>
                  article['title'] != null &&
                  article['title'] != '[Removed]' &&
                  article['source'] != null &&
                  article['source']['name'] != null &&
                  article['source']['name'] != '[Removed]')
              .toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load news: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching news: $e');
      throw Exception('Failed to load news: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Health News'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _articles.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewsDetailPage(_articles[index]),
                      ),
                    );
                  },
                  child: Card(
                      child: Container(
                    color: Color(
                        0xFFCDFADB), 
                    child: ListTile(
                      title: Text(
                        _articles[index]['title'],
                        style: TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(_articles[index]['source']['name']),
                    ),
                  )),
                );
              },
            ),
    );
  }
}
