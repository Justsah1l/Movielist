import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircut/pages/detail.dart';
import '../model/item.dart';
import 'package:dio/dio.dart';

class Futureelements extends StatefulWidget {
  Futureelements({super.key});

  @override
  State<Futureelements> createState() => _FutureelementsState();
}

class _FutureelementsState extends State<Futureelements> {
  List<Items> menu = [];

  Future getdata() async {
    var res = await Dio().get('https://api.tvmaze.com/search/shows?q=a');
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
  void initState() {
    getdata();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getdata(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            height: 250,
            child: ListView.builder(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              // controller: _scrollController,
              itemCount: menu.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    //width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage("${menu[index].url}"),
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
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          " Rating : ${menu[index].rating} / 10",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
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
    );
  }
}
