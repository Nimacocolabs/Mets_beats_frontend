import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mets_beats_app/Utilities/color_constant.dart';
import 'package:mets_beats_app/presentation/home_screen/home_screen.dart';
import 'package:mets_beats_app/widgets/custom_button.dart';



class RateUsScreen extends StatefulWidget {
  const RateUsScreen({Key? key}) : super(key: key);

  @override
  State<RateUsScreen> createState() => _RateUsScreenState();
}

class _RateUsScreenState extends State<RateUsScreen> {
  // The rating value
  double? _ratingValue;
  String app_name="Met's beats";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rate Us'),
          backgroundColor: ColorConstant.pink500,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                 Text(
                  'Enjoying ${app_name}?',
                  style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Tap a star to give your rating.',
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
                ),
                const SizedBox(height: 25),
                RatingBar(
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full:  Icon(Icons.star, color: ColorConstant.pink500),
                        half:  Icon(
                          Icons.star_half,
                          color:  ColorConstant.pink500,
                        ),
                        empty:  Icon(
                          Icons.star_outline,
                          color:ColorConstant.pink500,
                        )),
                    onRatingUpdate: (value) {
                      setState(() {
                        _ratingValue = value;
                      });
                    }),
                const SizedBox(height: 25),
                // Display the rate in number
                Container(
                  width: 60,
                  height: 60,
                  decoration:  BoxDecoration(
                      color: ColorConstant.pink500, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(
                    _ratingValue != null ? _ratingValue.toString() : 'Rate it!',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: CustomButton(
                    height: 38,
                    width: 120,
                    text: "Submit",
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SizedBox(
                            height: 80,
                            child: AlertDialog(
                              // title: new Text("Success"),
                              content:Image.asset(
                                "assets/images/submit.gif",
                                alignment: Alignment.center,
                              ),
                              actions: <Widget>[
                                Center(
                                  child: new CustomButton(
                                    height: 38,
                                    width: 120,
                                    text: "Ok",
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => HomeScreen()));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}