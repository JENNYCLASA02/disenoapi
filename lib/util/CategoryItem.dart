import 'package:api/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryItem extends StatelessWidget {
  final bool selected;
  final String category;

  const CategoryItem({Key? key, required this.selected, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 250),
      height: 20.h,
      width: 200.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: selected
            ? Border.all(width: 2, color: kPrimary2Color)
            : Border.all(color: Colors.white),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 4, offset: Offset(4, 8))
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            category,
            style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.black),
          )
        ],
      ),
    );
  }
}
