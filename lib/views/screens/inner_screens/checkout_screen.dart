import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_shop/provider/cart_provider.dart';
import 'package:multi_shop/views/screens/inner_screens/shipping_addreess_screen.dart';
import 'package:multi_shop/views/screens/main_screen.dart';
import 'package:uuid/uuid.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _selectedPaymentMethod = 'stripe';

  //get current user information
  String state = '';
  String city = '';
  String locality = '';

  @override
  void initState() {
    getUserData();
    super.initState();
  }

  //get current user details
  void getUserData() {
    Stream<DocumentSnapshot> userDataStream =
        _firestore.collection('buyers').doc(_auth.currentUser!.uid).snapshots();

    //listen to the stream and update the data
    userDataStream.listen((DocumentSnapshot userData) {
      if (userData.exists) {
        setState(() {
          state = userData.get('state');
          city = userData.get('city');
          locality = userData.get('locality');
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProviderData = ref.read(cartProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const ShippingAddreessScreen();
                      },
                    ),
                  );
                },
                child: SizedBox(
                  width: 335,
                  height: 74,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          width: 335,
                          height: 74,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: const Color(
                                0xFFEFF0F2,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 70,
                        top: 17,
                        child: SizedBox(
                          width: 215,
                          height: 41,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: -1,
                                top: -1,
                                child: SizedBox(
                                  width: 219,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'Add Address',
                                          style: GoogleFonts.getFont(
                                            'Lato',
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            height: 1.3,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          'enter city',
                                          style: GoogleFonts.getFont('Lato',
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              height: 1.3,
                                              color: const Color(0xFF7F808C)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 16,
                        top: 16,
                        child: SizedBox.square(
                          dimension: 42,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Positioned(
                                left: 0,
                                top: 0,
                                child: Container(
                                  width: 43,
                                  height: 43,
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFBF7F5),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      Positioned(
                                        left: 11,
                                        top: 11,
                                        child: Image.network(
                                          "https://storage.googleapis.com/codeless-dev.appspot.com/uploads%2Fimages%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F2ee3a5ce3b02828d0e2806584a6baa88.png",
                                          width: 20,
                                          height: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 305,
                        top: 25,
                        child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/codeless-app.appspot.com/o/projects%2Fnn2Ldqjoc2Xp89Y7Wfzf%2F6ce18a0efc6e889de2f2878027c689c9caa53feeedit%201.png?alt=media&token=a3a8a999-80d5-4a2e-a9b7-a43a7fa8789a',
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Your Items',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Flexible(
                child: ListView.builder(
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Text(
                                                    cartItem.productName,
                                                    style: GoogleFonts.getFont(
                                                      'Lato',
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height: 1.3,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
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
                    }),
              ),
              const SizedBox(height: 30),
              const Text(
                'Choose Payment Method',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              RadioListTile<String>(
                title: const Text('Stripe'),
                value: 'stripe',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
              RadioListTile<String>(
                title: const Text('Cash on Delivery'),
                value: 'cashOnDelivery',
                groupValue: _selectedPaymentMethod,
                onChanged: (String? value) {
                  setState(() {
                    _selectedPaymentMethod = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      bottomSheet: state == ''
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ShippingAddreessScreen();
                  }));
                },
                child: const Text(
                  'Add Address',
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () async {
                  if (_selectedPaymentMethod == 'stripe') {
                    //pay with stripe
                  } else {
                    // pay on delivery
                    setState(() {
                      isLoading = true;
                    });
                    for (var item
                        in ref.read(cartProvider.notifier).getCartItem.values) {
                      DocumentSnapshot userDoc = await _firestore
                          .collection('buyers')
                          .doc(_auth.currentUser!.uid)
                          .get();

                      CollectionReference orderRefer =
                          _firestore.collection('orders');
                      final orderId = const Uuid().v4();
                      await orderRefer.doc(orderId).set({
                        'orderId': orderId,
                        'productName': item.productName,
                        'productId': item.productId,
                        'size': item.productSize,
                        'quantity': item.quantity,
                        'price': item.quantity * item.productPrice,
                        'category': item.categoryName,
                        'productImage': item.imageUrl[0],
                        'state':
                            (userDoc.data() as Map<String, dynamic>)['state'],
                        'email':
                            (userDoc.data() as Map<String, dynamic>)['email'],
                        'locality': (userDoc.data()
                            as Map<String, dynamic>)['locality'],
                        'fullName': (userDoc.data()
                            as Map<String, dynamic>)['fullName'],
                        'buyerId': _auth.currentUser!.uid,
                        'deliveredCount': 0,
                        'delivered': false,
                        'processing': true,
                        'city':
                            (userDoc.data() as Map<String, dynamic>)['city'],
                      }).whenComplete(() {
                        cartProviderData.clear();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return MainScreen();
                            },
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.grey,
                            content: Text('order have been placed'),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      });
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 50,
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFF1532E7,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
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
            ),
    );
  }
}
