import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../style/styles.dart';

class AppCachedNetworkImage extends StatelessWidget {
  final String imageURL;
  final BoxFit fit;
  final Color color;
  const AppCachedNetworkImage({
    Key? key,
    required this.imageURL,
    required this.fit,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          color: color,
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => const SizedBox(
        child: CircularProgressIndicator(
          color: orange,
        ),
        width: 10,
        height: 10,
      ),
      errorWidget: (context, url, error) => Image.asset(
        'assets/images/notFound.jpg',
        fit: BoxFit.fill,
      ),
    );
  }
}
