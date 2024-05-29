import 'package:ai_app/modules/home/components/toggle_switcher.dart';
import 'package:ai_app/modules/home/controller/home_controller.dart';
import 'package:ai_app/style/app_textstyle.dart';
import 'package:ai_app/utils/view/photo_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../utils/helper/url_launcher.dart';
import '../../../utils/widget/custom_avartar.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var divider = Divider(
      color: context.theme.canvasColor,
      height: 30,
    );
    var listIcon = [
      FaIcon(
        color: context.theme.canvasColor,
        size: 25,
        FontAwesomeIcons.facebook,
      ),
      FaIcon(
        FontAwesomeIcons.instagram,
        color: context.theme.canvasColor,
        size: 25,
      ),
      FaIcon(
        FontAwesomeIcons.discord,
        color: context.theme.canvasColor,
        size: 25,
      ),
      FaIcon(
        FontAwesomeIcons.youtube,
        color: context.theme.canvasColor,
        size: 25,
      ),
    ];
    var text = [
      "Facebook",
      "Instagram",
      "Discord",
      "Youtube",
    ];
    var homeCon = Get.put(HomeController());
    return Drawer(
      width: context.width * 0.7,
      backgroundColor: context.theme.primaryColor,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(20))),
      child: DefaultTextStyle(
        style: AppTextStyle.txt14.copyWith(
          color: context.theme.canvasColor,
        ),
        child: SafeArea(
          bottom: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () {
                                return const PhotoViewScreen(
                                  imageUrl:
                                      "https://lh3.googleusercontent.com/a/AAcHTtcFBSTxsFGglWTNzd-aqEkkqq9qUoxS7GD19zR0bg=s576-c-no",
                                );
                              },
                            );
                          },
                          child: const CustomAvatar(
                            size: 80,
                            imgUrl:
                                "https://lh3.googleusercontent.com/a/AAcHTtcFBSTxsFGglWTNzd-aqEkkqq9qUoxS7GD19zR0bg=s576-c-no",
                          ),
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Theme",
                            ),
                            SizedBox(height: 10),
                            ToggleSwitcher(),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              divider,
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Name : N E A",
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Email : nea@example.com",
                    ),
                  ],
                ),
              ),
              divider,
              Column(
                children: [
                  const Text(
                    "Responses Language :",
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding:
                        const EdgeInsets.all(8.0).copyWith(left: 20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // from
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              await homeCon.changeLanguage(
                                context,
                              );
                            },
                            child: language(
                              homeCon.selectedLanIndex == 0
                                  ? "English"
                                  : "Khmer",
                              context,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemCount: listIcon.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 0.7,
                        color: context.theme.canvasColor.withOpacity(0.6),
                      ),
                    ),
                    onTap: () {
                      switch (index) {
                        case 0:
                          callLaunchUrl(
                            url:
                                "https://www.facebook.com/profile.php?id=100015017734815",
                            mode: LaunchMode.externalApplication,
                          );
                          break;
                        case 1:
                          callLaunchUrl(
                            url: "https://www.instagram.com/vaing_minea/?hl=en",
                            mode: LaunchMode.externalApplication,
                          );
                          break;
                        case 2:
                          callLaunchUrl(
                            url: "https://discord.com/channels/denji#7716",
                            mode: LaunchMode.externalApplication,
                          );
                          break;
                        case 3:
                          callLaunchUrl(
                            url:
                                "https://www.youtube.com/channel/UCjQprGf83umIaHbCLwRVBQg",
                            mode: LaunchMode.externalApplication,
                          );
                          break;
                      }
                    },
                    leading: listIcon[index],
                    title: Text(
                      text[index],
                      style: TextStyle(color: context.theme.canvasColor),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
              ),
              const Spacer(),
              divider,
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      width: 0.7,
                      color: context.theme.canvasColor.withOpacity(0.6),
                    ),
                  ),
                  onTap: () {
                    homeCon.clearChat();
                    Navigator.pop(context);
                  },
                  leading: Icon(
                    Icons.delete_outline_rounded,
                    color: context.theme.canvasColor,
                    size: 30,
                  ),
                  title: Text(
                    "Clear Chat",
                    style: TextStyle(color: context.theme.canvasColor),
                  ),
                ),
              ),
              divider,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Verson : 0.1.1"),
                  Text("Copyright© N E A"),
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Container language(String text, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: context.theme.canvasColor.withOpacity(0.9),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(14).copyWith(left: 0, right: 0),
      child: Text(
        text,
        style: TextStyle(
          color: context.theme.primaryColor,
        ),
      ),
    );
  }
}
