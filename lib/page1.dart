// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:simple_prj/data.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFFFBF2F4),
          child: ListView(
            children: [
              Stack(alignment: Alignment.bottomCenter, children: [
                Column(
                  children: [
                    Container(
                      height: 210,
                      color: Color.fromRGBO(18, 104, 255, 1),
                      child: buildTopContent(context),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 90,
                    )
                  ],
                ),
                Positioned(
                  top: 210 - 55,
                  child: Container(
                      child: getDisplayCard(context, metals['gold'], 110,
                          MediaQuery.of(context).size.width * 0.88)),
                )
              ]),
              buildList(context, metals)
            ],
          )),
    );
  }

  buildList(BuildContext context, Map<String, Map<String, dynamic>> metals) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getDisplayCard(context, metals['silver'], 110,
              MediaQuery.of(context).size.width * 0.94),
          SizedBox(
            height: 8,
          ),
          getDisplayCard(context, metals['platinum'], 110,
              MediaQuery.of(context).size.width * 0.94),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Do More With OneGold',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  buildTopContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                '\$' + '22,650.51',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(13, 19, 153, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: 110,
                  height: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '0.97%',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_drop_up,
                        color: Colors.green,
                      )
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                'Account value',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              Spacer(),
              Text(
                'Since last purchase',
                style: TextStyle(color: Colors.white, fontSize: 14),
              )
            ],
          ),
          Divider(
            thickness: 1,
            height: 30,
            color: Colors.white,
          ),
          Row(
            children: [
              Text('Cash Balance',
                  style: TextStyle(color: Colors.white, fontSize: 14)),
              Spacer(),
              Text('Metal Holdings',
                  style: TextStyle(color: Colors.white, fontSize: 14))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text('\$' + '384.60',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                width: 5,
              ),
              Container(
                  height: 15,
                  width: 15,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                    ),
                  )),
              Spacer(),
              Text('22,654',
                  style: TextStyle(color: Colors.white, fontSize: 16))
            ],
          ),
        ],
      ),
    );
  }
}

getDisplayCard(context, Map<String, dynamic>? metal, double height, width) {
  return Card(
    child: Container(
      height: height,
      margin: EdgeInsets.all(10),
      width: width,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  color: (metal!['color'] as Color).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: SizedBox(
                    height: 30,
                    width: 30,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: getSVGImage(
                        'lib/assets/gold.svg',
                        color: (metal!['color'] as Color).withOpacity(0.8),
                        height: 30.0,
                        width: 30.0,
                        iconName: 'portfolio',
                        isColor: false,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    metal['name'],
                    style: TextStyle(
                        color: (metal['color'] as Color).withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    metal['weight'] + ' oz',
                    style: TextStyle(color: Color.fromRGBO(142, 144, 152, 1)),
                  )
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '\$' + metal['hldngs'],
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    metal['ltp'],
                    style: TextStyle(color: Color.fromRGBO(142, 144, 152, 1)),
                  )
                ],
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Divider(
              height: 20,
              thickness: 1.0,
              color: Colors.grey[300],
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Metal Price',
                    style: TextStyle(
                        color: Color.fromRGBO(142, 144, 152, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('\$' + metal['price'])
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Change',
                    style: TextStyle(
                        color: Color.fromRGBO(142, 144, 152, 1), fontSize: 16),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    metal['chngprcnt'] + ' %',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget getSVGImage(
  String url, {
  Color? color,
  dynamic width,
  dynamic height,
  String? iconName,
  bool isColor = true,
}) {
  return SvgPicture.asset(
    url,
    color: color,
    height: height,
    width: width,
    fit: BoxFit.contain,
  );
}
