import 'package:flutter/material.dart';
import '../../../../../core/utils/assets.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(children: [
        AspectRatio(
          aspectRatio: 1.25 / 2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                image: const DecorationImage(
                    image: AssetImage(AssetsData.testImage), fit: BoxFit.fill)),
          ),
        ),
      ]),
    );
  }
}
