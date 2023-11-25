import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircut/model/item.dart';
import 'package:haircut/pages/detail.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController con = TextEditingController();
  bool shvis = false;
  List<Items> menu = [];

  Future getdata() async {
    menu.clear();
    var res =
        await Dio().get('https://api.tvmaze.com/search/shows?q=${con.text}');
    print(res.data[0]['show']['image']['medium']);
    print(res);
    for (var eachItem in res.data) {
      final item = Items(
        id: eachItem['show']['id'],
        name: eachItem['show']['name'],
        description: eachItem['show']['summary'],
        language: eachItem['show']['language'],
        country: eachItem['show']['network']['country']['name'],
        rating: eachItem['show']['rating']['average'].toString(),
        url: eachItem['show']['image']['medium'].toString(),
      );
      menu.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              controller: con,
              onSubmitted: (value) {
                getdata();
                setState(() {
                  shvis = true;
                });
              },
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 255, 255, 255)),
              leading: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.search),
              ),
              textStyle: MaterialStateProperty.all(const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
              hintText: "Name of the movie to search",
              hintStyle: MaterialStateProperty.all(const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Visibility(
              visible: shvis,
              child: Column(
                children: [
                  const Text(
                    "Search Results",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  FutureBuilder(
                    future: getdata(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          height: 650,
                          child: ListView.builder(
                            //shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            // controller: _scrollController,
                            itemCount: menu.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Container(
                                    //width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(() => Detailpage(
                                                  des: menu[index].description,
                                                  country: menu[index].country,
                                                  name: menu[index].name,
                                                  rating: menu[index].rating,
                                                  url: menu[index].url,
                                                ));
                                          },
                                          child: Container(
                                            height: 140,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "${menu[index].url}"),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          " ${menu[index].name}",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          " Rating : ${menu[index].rating} / 10",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
