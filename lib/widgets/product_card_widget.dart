import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget ShowProductCard({
  required BuildContext context,
  required String image,
  required String productName,
  required String productPrice,
})  {
  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 180,
                          width: double.infinity,
                          alignment: Alignment.topRight,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.shopping_cart,
                                color: Colors.white, size: 18),
                            onPressed: () {
                              SnackBar snackBar = SnackBar(
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: Text(
                                        tr('cart_done'),
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "${tr(productName)} ${tr('added')}",
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                                showCloseIcon: true,
                                duration: const Duration(seconds: 5),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(tr(productName),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                              const SizedBox(height: 6),
                              Text(productPrice,
                                  style: const TextStyle(
                                      color: Colors.brown,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                        ),
                      ],
                    );
}
