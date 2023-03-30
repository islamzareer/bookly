import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              text: "Free",
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: ()  {
                customlaunchUrl(context, book.volumeInfo.previewLink! );
              },
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              text: getText(book),
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }

  Future<void> customlaunchUrl(context, url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Can\'t launch $uri'),
        ),
      );
    }
  }

  String getText(BookModel book) {
    if (book.volumeInfo.previewLink != null) {
      return "Preview";
    } else {
      return "Not Avaliable";
    }
  }
}
