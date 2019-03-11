import 'package:flutter/material.dart';

class ThumbnailCard extends StatelessWidget {
  final String thumbnailHeroTag;
  final double thumbnailWidth;
  final Widget thumbnail;
  final Widget content;

  ThumbnailCard({ this.thumbnailHeroTag, this.thumbnailWidth, this.thumbnail, this.content });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: thumbnailHeroTag,
              child: SizedBox(
                width: this.thumbnailWidth ?? 80,
                child: ClipRect(
                  child: OverflowBox(
                    minHeight: 0,
                    minWidth: 0,
                    maxWidth: double.infinity,
                    child: thumbnail,
                  ),
                ),
              ),
            ),
            Expanded(
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
