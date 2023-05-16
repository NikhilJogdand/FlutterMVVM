import 'package:flutter/material.dart';
import 'package:mvvm/res/color.dart';

class RoundButton extends StatelessWidget {
  final String title;

  final bool loading;
  final VoidCallback onPress;

  RoundButton({
    required this.title,
    this.loading = false,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.buttonColor, borderRadius: BorderRadius.circular(10)),
        height: 40,
        width: 200,
        child: Center(
          child: loading ? const CircularProgressIndicator() : Text(
            title,
            style: TextStyle(color: AppColors.whiteColor),
          ),
        ),
      ),
    );
  }
}
