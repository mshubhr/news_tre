// ignore_for_file: file_names, unnecessary_string_interpolations, unnecessary_cast

import 'package:news_tre/bloc/mainBloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsViewPage extends StatefulWidget {
  const NewsViewPage({super.key, required this.index});
  final int index;
  @override
  State<NewsViewPage> createState() => _NewsViewPageState();
}

class _NewsViewPageState extends State<NewsViewPage> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          iconSize: 25,
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            iconSize: 25,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.black,
            ),
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            focusColor: const Color.fromARGB(255, 17, 23, 27),
            highlightColor: Colors.blueGrey.shade300,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              highlightColor: Colors.blueGrey.shade300,
              iconSize: 25,
              icon: const Icon(Icons.share),
              onPressed: () {
                // Handle share button click
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
          builder: (BuildContext context, state) {
        if (state is NewsChecked) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 3.5,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              '${state.apple.articles![widget.index].urlToImage}'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        '${state.apple.articles![widget.index].title}',
                        style: GoogleFonts.noticiaText(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                        '${state.apple.articles![widget.index].author}, ${state.apple.articles![widget.index].publishedAt?.substring(0, 10)}',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500)),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                          textAlign: TextAlign.justify,
                          '${state.apple.articles![widget.index].content}, ${state.apple.articles![widget.index].publishedAt?.substring(0, 10)}',
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 0, left: 280),
                      child: SizedBox(
                          width: 100,
                          child: GestureDetector(
                              onTap: () async {
                                Uri url = Uri.parse(
                                    '${state.apple.articles![widget.index].url.toString()}');
                                if (await canLaunchUrl(url as Uri)) {
                                  await launchUrl(url as Uri);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: Image.asset("assets/read_more.png"))),
                    )
                  ]),
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
}
