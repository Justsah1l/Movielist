import 'package:flutter/material.dart';

class Detailpage extends StatefulWidget {
  String? des;
  String? rating;
  String? country;
  String? name;
  String? url;

  Detailpage({
    super.key,
    required this.des,
    required this.country,
    required this.name,
    required this.rating,
    required this.url,
  });

  @override
  State<Detailpage> createState() => _DetailpageState();
}

String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return htmlText.replaceAll(exp, '');
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    String descrip = removeAllHtmlTags("${widget.des}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Netflix",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                width: 400,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${widget.url}"),
                        fit: BoxFit.cover),
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.all(17.0),
                child: Text(
                  "${widget.name}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Description",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(17.0),
                child: Text(
                  "${descrip}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(17.0),
                child: Text(
                  "Country - ${widget.country}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(17.0),
                child: Text(
                  "Rating - ${widget.rating}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
