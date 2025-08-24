import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Widget ShowOfferCard({
  required BuildContext context,
  required String title,
  required String subtitle,
  required String buttomText,
}) {return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white, // background color
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(.2), // shadow color
                          spreadRadius: 0, // how far the shadow spreads
                          blurRadius: 6, // softness of shadow
                          offset:
                              const Offset(0, 4), // position of shadow (x, y)
                        ),
                      ],
                      borderRadius:
                          BorderRadius.circular(8), // optional rounded corners
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(tr(title),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  tr(subtitle),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.grey, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStateProperty.all<Color>(Colors.brown),
                            ),
                            onPressed: () {},
                            child: Text(
                              tr(buttomText),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );

}
