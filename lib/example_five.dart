import 'dart:convert';

import 'package:apitutorial/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ExampleFive extends StatefulWidget {
  const ExampleFive({super.key});

  @override
  State<ExampleFive> createState() => _ExampleFiveState();
}

class _ExampleFiveState extends State<ExampleFive> {
  Future<ProductsModel> getProductList() async {
    final response = await http.get(Uri.parse(""));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("API Course"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getProductList(),
                builder: (context, snapshot) {
                  return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        if (snapshot.hasData) {
                          //error handle
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .3,
                                height: MediaQuery.of(context).size.height * 1,
                                child: ListView.builder(
                                    itemCount: snapshot
                                        .data!.data![index].images!.length,
                                    itemBuilder: (context, position) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width *
                                                  .25,
                                          height:
                                              MediaQuery.of(context).size.height *
                                                  .5,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(8.0),
                                              image: DecorationImage(
                                                  image: NetworkImage(snapshot.data!.data![index].images![position].url.toString()))),
                                        ),
                                      );
                                    }),
                              )
                            ],
                          );
                        } else {
                          return Text("Loading");
                        }
                      });
                }),
          )
        ],
      ),
    );
  }
}
