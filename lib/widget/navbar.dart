import 'package:bookstore/constants/Theme.dart';
import 'package:bookstore/widget/input.dart';
import 'package:flutter/material.dart';

// import 'package:material_kit_flutter/screens/categories.dart';
// import 'package:material_kit_flutter/screens/best-deals.dart';
// import 'package:material_kit_flutter/screens/search.dart';
// import 'package:material_kit_flutter/screens/cart.dart';
// import 'package:material_kit_flutter/screens/chat.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String categoryOne;
  final String categoryTwo;
  final bool searchBar;
  final bool backButton;
  final bool transparent;
  final bool rightOptions;
  final Function? getCurrentPage;
  final bool isOnSearch;
  // final TextEditingController searchController;
  final void Function(String)? searchOnChanged;
  final bool searchAutofocus;
  final bool noShadow;
  final Color bgColor;

  Navbar(
      {this.title = "Home",
      this.categoryOne = "",
      this.categoryTwo = "",
      this.transparent = false,
      this.rightOptions = true,
      this.getCurrentPage,
      // this.searchController = myController,
      this.isOnSearch = false,
      this.searchOnChanged,
      this.searchAutofocus = false,
      this.backButton = false,
      this.noShadow = false,
      this.bgColor = Colors.white,
      this.searchBar = false});

  final double _prefferedHeight = 180.0;

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  final myController = TextEditingController();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool categories =
        widget.categoryOne.isNotEmpty && widget.categoryTwo.isNotEmpty;

    return Container(
        height: widget.searchBar
            ? (!categories ? (178.0) : (210.0))
            : (!categories ? (102.0) : (150.0)),
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? Colors.black.withOpacity(0.6)
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: Offset(0, 5))
            ]),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(
                                !widget.backButton
                                    ? Icons.menu
                                    : Icons.arrow_back_ios,
                                color: !widget.transparent
                                    ? (widget.bgColor == Colors.white
                                        ? Colors.black
                                        : Colors.white)
                                    : Colors.white,
                                size: 24.0),
                            onPressed: () {
                              if (!widget.backButton)
                                Scaffold.of(context).openDrawer();
                              else
                                Navigator.pushReplacementNamed(
                                    context, '/home');
                            }),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(widget.title,
                              style: TextStyle(
                                  color: !widget.transparent
                                      ? (widget.bgColor == Colors.white
                                          ? Colors.black
                                          : Colors.white)
                                      : Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0)),
                        ),
                      ],
                    ),
                    if (widget.rightOptions)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Cart()));
                            },
                            child: IconButton(
                                icon: Icon(Icons.add_shopping_cart,
                                    color: !widget.transparent
                                        ? (widget.bgColor == Colors.white
                                            ? Colors.black
                                            : Colors.white)
                                        : Colors.white,
                                    size: 22.0),
                                onPressed: null),
                          ),
                        ],
                      )
                  ],
                ),
                if (widget.searchBar)
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 4, left: 15, right: 15),
                    child: Input(
                        placeholder: "What are you looking for?",
                        controller: myController,
                        onChanged: widget.searchOnChanged,
                        autofocus: widget.searchAutofocus,
                        outlineBorder: true,
                        enabledBorderColor: Colors.black.withOpacity(0.2),
                        focusedBorderColor: MaterialColors.muted,
                        suffixIcon:
                            Icon(Icons.zoom_in, color: MaterialColors.muted),
                        onTap: () {
                          // if (!widget.isOnSearch)
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Search()));
                        }),
                  ),
                SizedBox(
                  height: widget.searchBar ? 10 : 0,
                ),
                if (categories)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Categories()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.border_all,
                                color: Colors.black87, size: 22.0),
                            SizedBox(width: 10),
                            Text(widget.categoryOne,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16.0)),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        color: MaterialColors.muted,
                        height: 25,
                        width: 0.3,
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => BestDeals()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera_enhance,
                                color: Colors.black87, size: 22.0),
                            SizedBox(width: 10),
                            Text(widget.categoryTwo,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16.0)),
                          ],
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ));
  }
}
