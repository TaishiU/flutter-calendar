import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerScreen extends StatelessWidget {
  const ShimmerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ListTile example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              child: Column(
                children: [
                  Container(
                    width: width,
                    height: 20,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          children: [
                            Container(
                              color: Colors.grey.shade300,
                              width: 70,
                              height: 20,
                            ),
                            SizedBox(width: 10),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: width,
                    height: height * 0.5,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Container(
                              color: Colors.grey.shade300,
                              width: width,
                              height: 100,
                            ),
                            SizedBox(height: 10),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
