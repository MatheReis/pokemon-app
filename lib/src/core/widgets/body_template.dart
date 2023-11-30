import 'package:flutter/material.dart';
import 'package:pokemon_app/src/core/constants/app_colors.dart';
import 'package:transparent_image/transparent_image.dart';

class BodyTemplate extends StatelessWidget {
  final bool isDetailPage;
  final Widget body;
  final String? imgUrl;

  const BodyTemplate({
    Key? key,
    required this.isDetailPage,
    required this.body,
    this.imgUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String assetName = "assets/images/pokemon_logo.png";

    return Scaffold(
        appBar: isDetailPage
            ? _buildAppBarDetails(
                true,
                imgUrl != null
                    ? FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: imgUrl!,
                        imageScale: 0.75,
                      )
                    : Image.asset(
                        assetName,
                        height: 130,
                        width: 130,
                      ),
                AppColors.primary,
              )
            : _buildAppBar(
                const Text("dat"),
                Image.asset(
                  assetName,
                  height: 130,
                  width: 130,
                ),
                false,
              ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: body,
        ));
  }

  AppBar _buildAppBar(
    Widget? title,
    Widget? image,
    bool? isBack,
  ) {
    return AppBar(
      title: image,
      centerTitle: true,
      backgroundColor: AppColors.primary,
      elevation: 1,
      automaticallyImplyLeading: isBack!,
    );
  }

  AppBar _buildAppBarDetails(
    bool? isBack,
    Widget? title,
    Color? backgroundColor,
  ) {
    return AppBar(
      centerTitle: true,
      title: title,
      toolbarHeight: 200,
      elevation: 1,
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60),
        ),
      ),
    );
  }
}
