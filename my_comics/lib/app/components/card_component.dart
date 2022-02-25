import 'package:flutter/material.dart';
import 'package:my_comics/app/core/themes/app_text_styles.dart';
import 'package:my_comics/app/modules/home/models/comics_models.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardComponent extends StatelessWidget {
  const CardComponent({
    Key? key,
    this.infos,
    this.onTap,
  }) : super(key: key);

  final Results? infos;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CachedNetworkImage(
              imageUrl:
                  '${infos?.thumbnail?.path}.${infos?.thumbnail?.extension}',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
