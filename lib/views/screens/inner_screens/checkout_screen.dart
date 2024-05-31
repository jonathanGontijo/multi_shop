import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_shop/provider/cart_provider.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProviderData = ref.read(cartProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('checkout'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your Items',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListView.builder(
                itemCount: cartProviderData.length,
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemBuilder: (context, index) {
                  final cartItem = cartProviderData.values.toList()[index];
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 336,
                      height: 91,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: const Color(
                            0xFFEFF0F2,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            left: 6,
                            top: 6,
                            child: SizedBox(
                              width: 311,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 78,
                                    height: 78,
                                    clipBehavior: Clip.hardEdge,
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFBCC5FF)),
                                    child: Image.network(
                                      cartItem.imageUrl[0],
                                    ),
                                  ),
                                  const SizedBox(width: 11),
                                  Expanded(
                                    child: Container(
                                      height: 78,
                                      alignment: const Alignment(0, -0.51),
                                      child: SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              width: double.infinity,
                                              child: Text(
                                                cartItem.productName,
                                                style: GoogleFonts.getFont(
                                                  'Lato',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  height: 1.3,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                cartItem.categoryName,
                                                style: const TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    cartItem.discount.toStringAsFixed(2),
                                    style: GoogleFonts.getFont('Lato',
                                        fontSize: 14,
                                        color: Colors.blue,
                                        height: 1.3,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 50,
          decoration: BoxDecoration(
            color: const Color(
              0xFF1532E7,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Text(
              'PLACE ORDER',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
                height: 1.4,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
