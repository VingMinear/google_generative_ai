import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScreen extends StatelessWidget {
  const PhotoViewScreen({
    super.key,
    required this.imageUrl,
  });
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: PhotoView(
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 5,
          imageProvider: NetworkImage(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
