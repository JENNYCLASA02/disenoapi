import 'package:flutter/material.dart';

class BottomIcon {
  final IconData unselect, select;
  BottomIcon({required this.unselect, required this.select});
}

List<BottomIcon> bottomIcons = [
  BottomIcon(unselect: Icons.home_outlined, select: Icons.home),
  BottomIcon(unselect: Icons.book_outlined, select: Icons.book),
  BottomIcon(unselect: Icons.person_outline_rounded, select: Icons.person)
];
