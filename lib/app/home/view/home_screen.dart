import 'package:flutter/material.dart';
import 'package:s_medi/app/category_details/view/category_details.dart';
import 'package:s_medi/app/doctor_profile/view/doctor_view.dart';
import 'package:s_medi/app/helthnews/newspage.dart';
import 'package:s_medi/app/home/controller/home_controller.dart';
import 'package:s_medi/app/search/controller/search_controller.dart';
import 'package:s_medi/app/settings/controller/profile_controller.dart';
import 'package:s_medi/app/widgets/coustom_textfield.dart';
import 'package:s_medi/general/consts/consts.dart';
import 'package:get/get.dart';
import '../../../general/list/home_icon_list.dart';
import '../../search/view/search_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var searchcontroller = Get.put(DocSearchController());
    var controler = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        title: Row(
          children: [
            AppString.welcome.text.make(),
            const SizedBox(width: 5),
            controler.username.value.text.make(),
          ],
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search section
            Container(
              padding: const EdgeInsets.all(8),
              height: 70,
              color: AppColors.greenColor,
              child: Row(
                children: [
                  Expanded(
                    child: CoustomTextField(
                      textcontroller: searchcontroller.searchQueryController,
                      hint: AppString.search,
                      icon: const Icon(Icons.person_search_sharp),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      Get.to(() => SearchView(
                            searchQuery:
                                searchcontroller.searchQueryController.text,
                          ));
                    },
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: iconList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Get.to(() => CategoryDetailsView(
                                catName: iconListTitle[index]));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            padding: const EdgeInsets.all(12),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            child: Column(
                              children: [
                                Image.asset(
                                  iconList[index],
                                  width: 50,
                                ),
                                const SizedBox(height: 5),
                                iconListTitle[index].text.make(),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Popular Doctors",
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontSize: AppFontSize.size16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<QuerySnapshot>(
                    future: controller.getDoctorList(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        var data = snapshot.data?.docs;
                        return SizedBox(
                          height: 195,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: data?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(() => DoctorProfile(
                                        doc: data![index],
                                      ));
                                },
                                child: Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: AppColors.bgDarkColor,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  padding: const EdgeInsets.only(bottom: 5),
                                  margin: const EdgeInsets.only(right: 8),
                                  height: 120,
                                  width: 130,
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Container(
                                          color: AppColors.greenColor,
                                          child: Image.network(
                                            data?[index]['docImage'],
                                            height: 130,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      const Divider(),
                                      Text(
                                        data![index]['docName'].toString(),
                                        style: const TextStyle(
                                          fontSize: AppFontSize.size16,
                                        ),
                                      ),
                                      Text(
                                        data![index]['docCategory'].toString(),
                                        style: const TextStyle(
                                          fontSize: AppFontSize.size12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Latest News",
                    style: TextStyle(
                      color: AppColors.greenColor,
                      fontSize: AppFontSize.size16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height *
                        0.5, // Adjust the height as needed
                    child: NewsPage(),
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
