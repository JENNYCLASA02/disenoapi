import 'package:api/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/category.dart';

class CategoryItem extends StatelessWidget {
  final bool selected;
  final Category category;

  const CategoryItem({Key? key, required this.selected, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 250),
      height: 105,
      width: 78,
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
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 30,
                width: 46,
                decoration:
                    const BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 6),
                    blurRadius: 10,
                    spreadRadius: 1,
                  )
                ]),
              ),
              Image.asset(
                category.image,
                width: 46,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            category.name,
            style: GoogleFonts.roboto(fontSize: 14.sp, color: Colors.black),
          )
        ],
      ),
    );
  }
}
