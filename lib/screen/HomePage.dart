// ignore_for_file: file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_tre/bloc/mainBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<MainBloc>(context).add(CheckNEWS());
  }

  List type = ["Economy", "Politics", "Sports", 'Lifestyle'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "TRE News",
            style: GoogleFonts.noticiaText(
                fontSize: 30, fontWeight: FontWeight.w900),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            ),
            highlightColor: Colors.blueGrey.shade300,
          )
        ],
        leading: Builder(
          // Use Builder here to get a context with a Scaffold ancestor
          builder: (context) => IconButton(
            icon: const Icon(
              Icons.menu,
              size: 25,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        toolbarHeight: 80,
      ),
      drawer: _buildDrawer(),
      body: BlocBuilder<MainBloc, MainState>(builder: (context, state) {
        if (state is NewsChecked) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  CarouselSlider.builder(
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${state.apple.articles![itemIndex].urlToImage}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.center,
                                  colors: [
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(1),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.9),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.9),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.8),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.8),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.8),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.7),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.5),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.4),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.3),
                                    const Color.fromARGB(255, 5, 72, 127)
                                        .withOpacity(.1),
                                    const Color.fromARGB(0, 244, 240, 240),
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${state.apple.articles![itemIndex].author}, ${state.apple.articles![itemIndex].publishedAt?.substring(0, 10)}',
                                        style: GoogleFonts.mPlus1(
                                          color: Colors.white,
                                          fontSize: 15.0,
                                        )),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      '${state.apple.articles![itemIndex].title}',
                                      style: GoogleFonts.noticiaText(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w800,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(height: 10.0),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.40,
                        autoPlay: true,
                        initialPage: 3,
                        enableInfiniteScroll: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlayInterval: const Duration(seconds: 20),
                      )
                      //autoPlayAnimationDuration: Duration(seconds: 3)),
                      ),
                  ListTile(
                    title: Text(
                      "Popular",
                      style: GoogleFonts.noticiaText(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 100,
                    itemBuilder: (BuildContext context, int index) {
                      // final int typeIndex = index % type.length;

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 10, right: 10),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Colors.white, boxShadow: []),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 4.5,
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 10, top: 10),
                                  child: Container(
                                    height: 180,
                                    width: 170,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            '${state.apple.articles![index].urlToImage}'),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5)),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 200,
                                        child: Text(
                                          '${state.apple.articles![index].title}',
                                          style: GoogleFonts.noticiaText(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: SizedBox(
                                          width: 200,
                                          child: Text(
                                              '${state.apple.articles![index].author}, ${state.apple.articles![index].publishedAt?.substring(0, 10)}',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12.0,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 30),
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              "Show more",
                                              style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(.7),
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ]),
                            ),
                          ),
                          const Divider(
                            indent: 40,
                            endIndent: 40,
                            thickness: 2,
                          )
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        } else if (state is NewsError) {
          return Text(state.error);
        } else {
          return const Center(
              child: CupertinoActivityIndicator(
            radius: 30,
            color: Color.fromARGB(255, 73, 176, 250),
          ));
        }
      }),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Breaking News',
              style: GoogleFonts.noticiaText(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.black,
              ),
            ),
          ),
          _buildDrawerItem('Economy'),
          _buildDrawerItem('Politics'),
          _buildDrawerItem('Sports'),
          _buildDrawerItem('Lifestyle'),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.only(right: 180),
                child: Text(
                  "Favourites",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              )),
          const Padding(
            padding: EdgeInsets.only(top: 250),
            child: Divider(
              indent: 20,
              endIndent: 20,
            ),
          ),
          ListTile(
            title: const Row(
              children: [
                Icon(
                  Icons.settings,
                  size: 30,
                ),
                SizedBox(width: 10),
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            onTap: () {
              // Handle the onTap for the Settings item
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        // Handle the onTap for each drawer item
        // For example, you might want to navigate to a different screen
      },
    );
  }
}
