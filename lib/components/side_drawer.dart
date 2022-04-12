// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall_it/components/filter_tile.dart';
import 'package:wall_it/data/data.dart';
import 'package:wall_it/login/login_controller.dart';
import 'package:wall_it/models/filter_model.dart';

class SideBar extends StatefulWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<FilterModel> filters = <FilterModel>[];

  @override
  void initState() {
    filters = getFilters();
    super.initState();
  }

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: UserAccountsDrawerHeader(
                  accountName: Text(
                    controller.googleAccount.value?.displayName ?? 'Hey',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  accountEmail: Text(
                    controller.googleAccount.value?.email ??
                        'Welcome@walllit.com',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: Image.network(
                            controller.googleAccount.value?.photoUrl ?? '')
                        .image,
                    radius: 100,
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                            "https://images.pexels.com/photos/3219951/pexels-photo-3219951.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    return FilterTile(
                        imgurl: filters[index].imgUrl,
                        fildata: filters[index].name);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
