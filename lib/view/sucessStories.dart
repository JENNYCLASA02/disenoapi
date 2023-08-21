import 'package:api/model/Stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessStories extends StatefulWidget {
  const SuccessStories({Key? key}) : super(key: key);

  @override
  State<SuccessStories> createState() => _SuccessStoriesState();
}

class _SuccessStoriesState extends State<SuccessStories> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Text(
              "Historias de Éxito",
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 10.h),
              children: <Widget>[
                Container(
                  height: 450.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8))
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          storiesModel[0].image,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(storiesModel[0].title,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                storiesModel[0].description,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(fontSize: 13.sp),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 450.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8))
                    ],
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          storiesModel[1].image,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(storiesModel[1].title,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                storiesModel[1].description,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(fontSize: 13.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 450.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8))
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Image.asset(
                              storiesModel[2].image,
                              fit: BoxFit.fill,
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(storiesModel[2].title,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                storiesModel[2].description,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(fontSize: 13.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: 500.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 4,
                          offset: Offset(4, 8))
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200.h,
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: Image.asset(
                              storiesModel[3].image,
                              fit: BoxFit.fill,
                            )),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(storiesModel[3].title,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              height: 5.h,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                storiesModel[3].description,
                                textAlign: TextAlign.justify,
                                style: GoogleFonts.poppins(fontSize: 13.sp),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
