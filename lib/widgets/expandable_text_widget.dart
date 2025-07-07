import 'package:app1/utilis/colors.dart';
import 'package:app1/utilis/dimensions.dart';
import 'package:app1/widgets/small_text.dart';
import 'package:flutter/material.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({super.key, required this.text});

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalText;
  late String secondHalfText;
  bool hiddenText = true;
  double textHeight = Dimensions.screenHeight/5.63;
  @override
  void initState(){
    super.initState();
    if(widget.text.length > textHeight){
      firstHalText = widget.text.substring(0,textHeight.toInt());
      secondHalfText = widget.text.substring(textHeight.toInt()+1,widget.text.length);
    }else{
      firstHalText = widget.text;
      secondHalfText="";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:secondHalfText.isEmpty?SmallText(color: AppColors.paraColor,size: Dimensions.getHeight(16),text: firstHalText):Column(
        children: [
          SmallText(height: 1.8, color: AppColors.paraColor, size: Dimensions.getHeight(16), text: hiddenText?("$firstHalText..."):(firstHalText + secondHalfText)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                SmallText(text: "Show More", color: AppColors.mainColor,),
                Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,color:AppColors.mainColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

