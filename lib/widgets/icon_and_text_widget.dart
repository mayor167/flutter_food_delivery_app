import 'package:app1/utilis/dimensions.dart';
import 'package:app1/widgets/small_text.dart';
import 'package:flutter/material.dart';

class IconAndTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;
  const IconAndTextWidget({
    super.key, 
    required this.icon,
    required this.text,
    required this.iconColor
    });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Icon(icon, color: iconColor,size: Dimensions.getHeight(22),),
          SizedBox(width: Dimensions.getWidth(5),),
          SmallText(text: text, size:Dimensions.getHeight(11) ,),
        ],
    );
  }
}