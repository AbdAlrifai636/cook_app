import 'package:cooc_project/config/service_locater.dart';
import 'package:cooc_project/res/color_app.dart';
import 'package:cooc_project/res/string_app.dart';
import 'package:cooc_project/services/services.dart';
import 'package:cooc_project/widgets/button_widgets/container_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:gap/gap.dart';
import 'package:get_storage/get_storage.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Services services = Services();
  late dynamic id;
  late dynamic token;
  @override
  void initState() {
    id = getIt<GetStorage>().read('id');
    token = getIt<GetStorage>().read('token');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: Gap(30),
            ),
            _sliverAppBar(onTap: () {}),
            FutureBuilder(
                future: services.getAllMeals(id, token),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const SliverToBoxAdapter(
                        child: UnconstrainedBox(
                            child: CircularProgressIndicator()));
                  } else if (snapshot.hasError) {
                    return SliverToBoxAdapter(
                        child: Center(
                      child: Text("there is an error $snapshot"),
                    ));
                  } else if (snapshot.hasData) {
                    return SliverList(
                        delegate: SliverChildBuilderDelegate(
                            childCount: snapshot.data!.meals.length,
                            (context, index) {
                      return _listTile(
                          urlImage: snapshot.data!.meals[index].images[0],
                          titleText: snapshot.data!.meals[index].name,
                          subTitleText: snapshot.data!.meals[index].description,
                          subTitleTextTwo:
                              "${snapshot.data!.meals[index].price}",
                          onTapClose: () {});
                    }));
                  } else {
                    return SliverToBoxAdapter(child: Container());
                  }
                }),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
          backgroundColor: ColorApp.WHITE,
          height: 66,
          destinations: [
            NavigationDestination(
                icon: FaIcon(
                  FontAwesomeIcons.home,
                  color: ColorApp.PRIMERY,
                ),
                label: "Menu"),
            NavigationDestination(
                icon: FaIcon(
                  FontAwesomeIcons.user,
                  color: ColorApp.PRIMERY,
                ),
                label: "profile"),
          ]),
      backgroundColor: ColorApp.WHITE,
    );
  }
}

_sliverAppBar({void Function()? onTap}) {
  return SliverAppBar(
    backgroundColor: ColorApp.WHITE,
    pinned: true,
    floating: true,
    expandedHeight: 20,
    flexibleSpace: FlexibleSpaceBar(
      background: Column(
        children: [
          InkWell(
              onTap: onTap,
              child: ContainerButtonWidget(text: StringApp.addMeal)),
        ],
      ),
    ),
  );
}

_listTile(
    {required String urlImage,
    required String titleText,
    required String subTitleText,
    required String subTitleTextTwo,
    void Function()? onTapClose}) {
  return ListTile(
    leading: Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                urlImage,
              ))),
    ),
    title: Text(
      titleText,
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, color: ColorApp.BLACK),
    ),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subTitleText,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: ColorApp.grey),
        ),
        Gap(10),
        Text(
          subTitleTextTwo,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w400, color: ColorApp.grey),
        ),
      ],
    ),
    trailing: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
            color: ColorApp.red, borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          onTap: onTapClose,
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.close,
              color: ColorApp.WHITE,
            ),
          ),
        )),
  );
}
