import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:real_estate_app/common/utils/pallets.dart';
import 'package:real_estate_app/common/widgets/filledtextfield.dart';
import 'package:popover/popover.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();

  void startAnimation() {
    final state = _SearchScreenState();
    state.triggerAnimations();
  }
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late Animation<double> _buySearchAnimation;
  
  late Animation<double> _sendAnimation;
  late AnimationController _sendController;

  late Animation<double> _popupAnimation;
  late AnimationController _popupController;
  late Animation<double> _listAnimation;
  late AnimationController _listController;
late AnimationController _buySearchController ;
  bool isExpanded = true;
  bool showText = true;
  double containerWidth = 50;

  @override
  void dispose() {
    _buySearchController.dispose();
    _sendController.dispose();
    _listController.dispose();
    _popupController.dispose();
    super.dispose();
  }

@override
void initState() {
  super.initState();


  _buySearchController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  _buySearchAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: _buySearchController,
      curve: Curves.easeOut,
    ),
  );


  _listController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  _listAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: _listController,
      curve: Curves.easeOut,
    ),
  );

  _popupController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  _popupAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: _popupController,
      curve: Curves.easeOut,
    ),
  );

  _sendController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 800),
  );

  _sendAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: _sendController,
      curve: Curves.easeOut,
    ),
  );

  // Optional: Start the animations if required immediately
  Future.delayed(const Duration(milliseconds: 500), () {
    if (mounted) {
      setState(() {
        containerWidth = 100;
        _buySearchController.forward();  // Start the animation after initialization
        _listController.forward();
        _popupController.forward();
        _sendController.forward();
      });
    }
  });
}


  void onMapLayersClicked() {
    setState(() {
      isExpanded = !isExpanded;
      containerWidth = isExpanded ? 100 : 50;
      showText = !showText;
    });
  }

  void triggerAnimations() {
    _buySearchController.forward();
    _listController.forward();
    _popupController.forward();
    _sendController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/jpeg/maps.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 40),
                    ScaleTransition(
                      scale: _buySearchAnimation,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              child: FilledTextField(
                                fillColor: const Color(0xfffffffd),
                                radius: BorderRadius.circular(25),
                                preffix: const Icon(
                                  Iconsax.search_normal_1,
                                  size: 18,
                                  color: Color(0xffa5957e),
                                ),
                                hint: "Saint PetersBurg",
                              ),
                            ),
                            const SizedBox(width: 10),
                            const CircleAvatar(
                              backgroundColor: Color(0xfffffffd),
                              radius: 17,
                              child: Icon(
                                Iconsax.setting_4,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 150),
                    // Animate the containers here
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildAnimatedContainer(),
                          buildAnimatedContainer(),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: FadeInLeft(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: buildAnimatedContainer(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildAnimatedContainer(),
                          buildAnimatedContainer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            showPopover(
                              context: context,
                              bodyBuilder: (context) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(Iconsax.security),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text("Cosy Areas")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                        onMapLayersClicked();
                                      },
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Iconsax.wallet,
                                            color: Colors.yellow,
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Text(
                                            "Price",
                                            style:
                                                TextStyle(color: Colors.yellow),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      children: [
                                        Icon(Iconsax.bag),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text("Infrastructur")
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    const Row(
                                      children: [
                                        Icon(Iconsax.layer),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Text("Without My Layers")
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              direction: PopoverDirection.bottom,
                              width: 200,
                              height: 180,
                              arrowHeight: 0,
                              arrowWidth: 0,
                              radius: 20,
                            );
                          },
                          child: ScaleTransition(
                            scale: _popupAnimation,
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: const Color(0xff727272),
                              ),
                              child: const Icon(
                                Iconsax.layer,
                                color: Pallets.grey90,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ScaleTransition(
                              scale: _sendAnimation,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: const Color(0xff727272),
                                ),
                                child: const Icon(
                                  Iconsax.send_1,
                                  color: Pallets.grey90,
                                ),
                              ),
                            ),
                            ScaleTransition(
                              scale: _listAnimation,
                              child: Container(
                                padding:
                                    const EdgeInsets.only(right: 20, left: 10),
                                width: 200,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color(0xff727272),
                                ),
                                child: const Row(
                                  children: [
                                    Icon(
                                      Iconsax.textalign_left,
                                      color: Pallets.grey90,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      "List of variants",
                                      style:
                                          TextStyle(color: Color(0xffd9d9d9)),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAnimatedContainer() {
    return AnimatedContainer(
      alignment: Alignment.center,
      height: 40,
      width: containerWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
        color: Color(0xfffc9e12),
      ),
      child: showText
          ? const Text(
              '10.6 mp',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            )
          : const Icon(
              Icons.window_outlined,
              color: Colors.white,
            ),
    );
  }
}
