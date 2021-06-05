import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

const defaultIconSize = 24.0;
const defaultIconColor = Color(0xFF000000);

class AdwaitaIcon extends StatelessWidget {
  final String asset;
  final double? size;
  final Color? color;
  final String? semanticLabel;

  const AdwaitaIcon(
    this.asset, {
    Key? key,
    this.size,
    this.color,
    this.semanticLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      package: 'adwaita_icons',
      width: size ?? defaultIconSize,
      height: size ?? defaultIconSize,
      color: color ?? defaultIconColor,
      semanticsLabel: semanticLabel,
    );
  }
}
