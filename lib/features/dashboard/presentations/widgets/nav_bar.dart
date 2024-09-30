import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NavBar extends StatefulWidget {
  const NavBar(
      {Key? key,
      required this.navItem,
      required this.onTap,
      this.hasFab = false,
      this.showIndicator = true,
      this.selectedIconColor,
      this.unselectedIconColor, this.indicator})
      : super(key: key);
  final List<NavItemModel> navItem;
  final Function(int index) onTap;
  final bool? hasFab;
  final bool? showIndicator;
  final Color? selectedIconColor;
  final Color? unselectedIconColor;
  final Widget? indicator;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    var items = List.generate(
        widget.navItem.length,
        (index) => Expanded(
              child: InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  widget.onTap(index);
                  _switchTab(index);
                  log(index.toString());
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 5,left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color:index == _selectedIndex?Color(0xfffc9e12): Color(0xff1b1a20)
                    ),
                    height: 53,
                    width: 53,
                    child: NavItem(
                      navItem: widget.navItem[index],
                      isSelected: index == _selectedIndex,
                      showIndicator: widget.showIndicator!,
                      selectedIconColor: widget.selectedIconColor ??
                         Colors.white,
                      unselectedIconColor: widget.selectedIconColor ?? Colors.white,
                      indicator:widget.indicator ?? const NavNotch(),
                    ),
                  ),
                ),
              ),
            ));



    return BottomAppBar(
      height: 60,
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),

        ),
      ),
      surfaceTintColor:Color(0xff222126),
      clipBehavior: Clip.none,
      color: Color(0xff222126),
      shadowColor: Color(0xff222126),
      padding: EdgeInsets.zero,
      elevation: 0,
      child: Row(
        children: items,
      ),
    );
  }

  void _switchTab(int index) {
    _selectedIndex = index;

    setState(() {});
  }
}

class NavItem extends StatefulWidget {
  final NavItemModel navItem;
  final bool isSelected;
  final bool showIndicator;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Widget indicator;

  const NavItem({
    Key? key,
    required this.navItem,
    required this.isSelected,
    required this.showIndicator,
    required this.selectedIconColor,
    required this.unselectedIconColor, required this.indicator,
  }) : super(key: key);

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 16,
        ),
        Expanded(
          flex: 2,
          child: Theme(
            data: ThemeData(
                iconTheme: IconThemeData(
                    color: widget.isSelected
                        ? widget.selectedIconColor
                        : widget.unselectedIconColor)),
            child: AnimatedCrossFade(
                firstChild: widget.navItem.icon,
                secondChild: widget.navItem.selectedIcon ?? widget.navItem.icon ,
                crossFadeState:
                    widget.isSelected && widget.navItem.selectedIcon != null
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300)),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        SizedBox(
          height: 10,
          child: AnimatedCrossFade(
              secondCurve: Curves.fastOutSlowIn,
              firstCurve: Curves.bounceInOut,
              firstChild: widget.indicator,
              secondChild: SizedBox(),
              crossFadeState: widget.showIndicator && widget.isSelected
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300)),
        ),
      ],
    );
  }
}

class NavItemModel {
  final VoidCallback onTap;
  final Widget icon;
  final Widget? selectedIcon;

  NavItemModel({
    required this.onTap,
    required this.icon,
    this.selectedIcon,
  });
}

class NavNotch extends StatelessWidget {
  const NavNotch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}
