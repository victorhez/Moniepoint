import 'package:animate_do/animate_do.dart';

import 'package:flutter/material.dart';

import 'package:iconsax/iconsax.dart';
import 'package:real_estate_app/common/utils/pallets.dart';


import '../../common/widgets/filledtextfield.dart';
import '../search_screen/presentation/screens/searchscreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<int> _animation;
  late Animation<int> _animationsecond;

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  late AnimationController _imageScaleController;
  late Animation<double> _imageScaleAnimation;

  late AnimationController _buyScaleController;
  late Animation<double> _buyScaleAnimation;
  late AnimationController _rentScaleController;
  late Animation<double> _rentScaleAnimation;

  bool _showSearch = false;
  bool _shownamedes = false;
  bool _shownabuySale = false;
  bool _shownhouses = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showSearch = true;
      });
    });
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _shownhouses = true;
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _shownamedes = true;
      });
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        _shownabuySale = true;

        _buyScaleController = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 800),
        );
        _buyScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _buyScaleController,
            curve: Curves.easeOut,
          ),
        );
        _buyScaleController.forward();

        _rentScaleController = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 800),
        );
        _rentScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: _rentScaleController,
            curve: Curves.easeOut,
          ),
        );
        _rentScaleController.forward();

        _animationController = AnimationController(
          vsync: this,
          duration: const Duration(seconds: 2),
        );

        _animation = IntTween(begin: 0, end: 1034).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut,
          ),
        );
        _animationsecond = IntTween(begin: 0, end: 2034).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOut,
          ),
        );

        _animationController.forward();
      });
    });

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = IntTween(begin: 0, end: 1034).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
    _animationsecond = IntTween(begin: 0, end: 2034).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );

    _animationController.forward();

    _scaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _scaleController,
        curve: Curves.elasticOut,
      ),
    );

    _scaleController.forward();

    _imageScaleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _imageScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _imageScaleController,
        curve: Curves.elasticOut,
      ),
    );

    _imageScaleController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scaleController.dispose();
    _imageScaleController.dispose();
    _buyScaleController.dispose();
    _rentScaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfff8f1e8),
              Color(0xfffad7ad),
              Color(0xfffad7ad),
            ],
            begin: Alignment.topLeft,
            end: Alignment.topRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _showSearch
                              ? FadeInLeft(
                                  duration: const Duration(milliseconds: 1200),
                                  child: const SizedBox(
                                    width: 200,
                                    child: FilledTextField(
                                      fillColor: Color(0xfffffffd),
                                      preffix: Icon(
                                        Iconsax.location,
                                        size: 18,
                                        color: Color(0xffa5957e),
                                      ),
                                      hint: "Saint PetersBurg",
                                    ),
                                  ),
                                )
                              : const SizedBox.shrink(),


                          ScaleTransition(
                            scale: _imageScaleAnimation,
                            child: Container(
                              height: 60,
                              width: 60 ,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30 ),
                                  // color: Colors.green,
                                image: const DecorationImage(
                                  image: AssetImage("assets/jpg/profile.jpg"),
                                fit: BoxFit.cover,
                                ),
                              ),
                            )

                          ),

                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      _shownamedes
                          ? FadeInDown(
                              duration: const Duration(milliseconds: 1200),
                              child: const Text(
                                "Hi, Mirina",
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 25,
                                  color: Color(0xffa5957e),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                      _shownamedes
                          ? FadeInUp(
                              duration: const Duration(milliseconds: 1200),
                              child: const Text(
                                "Let's select your\nperfect place",
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.w500),
                              ),
                            )
                          : SizedBox.shrink(),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    _shownabuySale
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ScaleTransition(
                                  scale: _buyScaleAnimation,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 170,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: const Color(0xfffc9e12),
                                      borderRadius: BorderRadius.circular(80),
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Buy",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                        AnimatedBuilder(
                                          animation: _animation,
                                          builder: (context, child) {
                                            return Text(
                                              '${_animation.value}', // Animate the number from 0 to 1034
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 30,
                                                color: Colors.white,
                                              ),
                                            );
                                          },
                                        ),
                                        const Text(
                                          "offers",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                ScaleTransition(
                                  scale: _rentScaleAnimation,
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    height: 170,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      color: const Color(0xfffffffd),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Rent",
                                          style: TextStyle(
                                            color: Color(0xffa5957e),
                                          ),
                                        ),
                                        const SizedBox(height: 40),
                                        AnimatedBuilder(
                                          animation: _animationsecond,
                                          builder: (context, child) {
                                            return Text(
                                              '${_animationsecond.value}',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 30,
                                                color: Colors.black,
                                              ),
                                            );
                                          },
                                        ),
                                        const Text(
                                          "offers",
                                          style: TextStyle(
                                            color: Color(0xffa5957e),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          )
                        : SizedBox.shrink(),
                    const SizedBox(
                      height: 40,
                    ),
                    _shownhouses
                        ? FadeInUp(
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (index)=>SearchScreen()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                padding:const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                // height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40)),
                                    color: Pallets.white),
                                child: Column(
                                  children: [
                                    Stack(clipBehavior: Clip.none, children: [
                                      ScaleTransition(
                                        scale: _imageScaleAnimation,
                                        child: Container(
                                          height: 200,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            image: const DecorationImage(
                                                image: AssetImage(
                                                    "assets/jpg/room.jpg"),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        child: FadeInLeftBig(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Container(
                                              height: 50,
                                              width: 300,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffa59e99)
                                                      .withOpacity(0.7),
                                                  borderRadius:
                                                      BorderRadius.circular(25)),
                                              child: const Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.only(left: 10),
                                                    child: Text(
                                                      "GladKova ST.,25",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 70,
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            right: 3),
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Colors.white,
                                                          radius: 23,
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            size: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ]),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Stack(children: [
                                          ScaleTransition(
                                            scale: _imageScaleAnimation,
                                            child: Container(
                                              height: 300,
                                              width: 160,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Color(0xffcbbaa7),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        "assets/jpg/room3.jpg"),
                                                    fit: BoxFit.cover),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            child: FadeInLeftBig(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Container(
                                                  height: 40,
                                                  width: 140,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xffc7c2bb),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: const Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            left: 10),
                                                        child:
                                                            Text("GladKova ST"),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets.only(
                                                            right: 5),
                                                        child: CircleAvatar(
                                                          backgroundColor:
                                                              Colors.white,
                                                          radius: 18,
                                                          child: Icon(
                                                            Icons
                                                                .arrow_forward_ios_outlined,
                                                            size: 16,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ]),
                                        SizedBox(
                                            height: 300,
                                            width: 160,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Stack(children: [
                                                  ScaleTransition(
                                                    scale: _imageScaleAnimation,
                                                    child: Container(
                                                      height: 145,
                                                      width: 160,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20),
                                                        image: const DecorationImage(
                                                            image: AssetImage(
                                                                "assets/jpg/room2.jpg"),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 10,
                                                    child: FadeInLeftBig(
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            horizontal: 20),
                                                        child: Container(
                                                          height: 40,
                                                          width: 140,
                                                          decoration: BoxDecoration(
                                                              color: Color(
                                                                  0xffc7c2bb),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                          child: const Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 10),
                                                                child: Text(
                                                                    "GladKova ST"),
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: 3),
                                                                child:
                                                                    CircleAvatar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .white,
                                                                  radius: 18,
                                                                  child: Icon(
                                                                    Icons
                                                                        .arrow_forward_ios_outlined,
                                                                    size: 16,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                                Stack(children: [
                                                  ScaleTransition(
                                                    scale: _imageScaleAnimation,
                                                    child: Container(
                                                      height: 145,
                                                      width: 170,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20),
                                                        color: Color(0xffcbbaa7),
                                                        image: const DecorationImage(
                                                            image: AssetImage(
                                                                "assets/jpg/room2.jpg"),
                                                            fit: BoxFit.cover),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 10,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 20),
                                                      child: Container(
                                                        height: 40,
                                                        width: 140,
                                                        decoration: BoxDecoration(
                                                            color:
                                                                Color(0xffc7c2bb),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        25)),
                                                        child: const Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      left: 10),
                                                              child: Text(
                                                                  "GladKova ST"),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsets.only(
                                                                      right: 3),
                                                              child: CircleAvatar(
                                                                radius: 18,
                                                                backgroundColor:
                                                                    Colors.white,
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_forward_ios_outlined,
                                                                  size: 16,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ]),
                                              ],
                                            ))
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
