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
              onPressed: () async {
                final Uri url = Uri.parse(book.volumeInfo.previewLink!);
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                } else {
                  throw Exception('Could not launch $url');
                }
              },
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              text: "Preview",
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
