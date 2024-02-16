import 'package:s_medi/general/consts/consts.dart';

class NewsDetailPage extends StatelessWidget {
  final dynamic article;

  NewsDetailPage(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: Text(article['title']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(article['urlToImage']),
            const SizedBox(height: 10),
            Text(
              article['title'],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              article['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              'Published at: ${article['publishedAt']}',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 10),
            Text(
              article['content'],
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
