import 'dart:core';

import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  String image ;
  String  name ;
  int totalCases , totalDeaths, totalRecovered , active , critical, todayRecovered , test;

  DetailScreen({
    required this.image ,
    required this.name ,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.test,
  }) ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        centerTitle: true,

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    child: Column(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * .06,),
                        ReusableRow(title: 'Total Tests', value:test.toString(),),
                        ReusableRow(title: 'Cases', value: totalCases.toString(),),
                        ReusableRow(title: 'Recovered', value:  totalRecovered.toString(),),
                        ReusableRow(title: 'Death', value:  totalDeaths.toString(),),
                        ReusableRow(title: 'Critical', value: critical.toString(),),
                        ReusableRow(title: 'Today Recovered', value:totalRecovered.toString(),),


                      ],
                    ),
                  ),
                ),
                 CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(image),
                  ),

              ],
            )

          ],
        ),
      ),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value ;
  ReusableRow({Key? key , required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10 , right: 10 , top: 10 , bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value)
            ],
          ),
          SizedBox(height: 5,),
          Divider()
        ],
      ),
    );
  }
}