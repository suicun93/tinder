import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../views/my_image.dart';
import '../../../common/const.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tinder'),
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: const Icon(Icons.home),
        actions: const [
          Icon(CupertinoIcons.heart_fill),
          SizedBox(width: 15),
        ],
      ),
      body: Obx(
        () {
          if (controller.people.isEmpty) {
            return const Center(
                child: CircularProgressIndicator(),
              );
          } else {
            final person = controller.people.first;
            return Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: MyImage(link: person.picture!.large!),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      child: Text(
                        '${person.name?.fullName}, ${person.dob?.age}',
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ..._informationView(
                      title: 'Distance',
                      content: '${person.location?.distanceTo()} km',
                      icon: Icons.social_distance_outlined,
                    ),
                    ..._informationView(
                      title: 'Location',
                      content: '${person.location?.fullLocation}',
                      icon: Icons.location_on_outlined,
                    ),
                    ..._informationView(
                      title: 'Gender',
                      content: '${person.gender}'.capitalizeFirst!,
                      icon: Icons.male,
                    ),
                    ..._informationView(
                      title: 'Phone',
                      content: '${person.phone}',
                      icon: Icons.phone,
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }

  List<Widget> _informationView({
    required String title,
    required String content,
    required IconData icon,
  }) =>
      [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 15,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(content),
        const SizedBox(height: 8),
      ];
}
