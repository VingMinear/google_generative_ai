import 'dart:async';
import 'package:ai_app/modules/home/components/side_menu.dart';
import 'package:ai_app/modules/home/controller/home_controller.dart';
import 'package:ai_app/style/app_color.dart';
import 'package:ai_app/style/app_textstyle.dart';
import 'package:ai_app/utils/widget/custom_textfiedl.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../../../utils/widget/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final scaffKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var scrollController = ScrollController();
    var homeCon = Get.put(HomeController());
    return Scaffold(
      key: scaffKey,
      drawerEdgeDragWidth: context.width * 0.7,
      drawer: const SideMenu(),
      appBar: primaryAppBar(
        text: "Chat GPT",
        leadingWidth: 60,
        leading: IconButton(
          onPressed: () {
            scaffKey.currentState!.openDrawer();
            FocusManager.instance.primaryFocus!.unfocus();
          },
          icon: const FaIcon(
            FontAwesomeIcons.barsStaggered,
            color: Colors.white,
            size: 23,
          ),
        ),
        spaceLeft: 5,
        actions: [
          IconButton(
            onPressed: () {
              Future.delayed(
                const Duration(milliseconds: 400),
                () {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
              );
            },
            icon: const FaIcon(
              FontAwesomeIcons.key,
              size: 20,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          homeCon.listChat.isEmpty
              ? const Expanded(
                  child: Center(
                    child: Text("Chat is empty"),
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    reverse: true,
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        homeCon.listChat.isEmpty
                            ? const Text("Ask Something")
                            : const SizedBox.shrink(),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: homeCon.listChat.length,
                          itemBuilder: (context, index) {
                            var chat = homeCon.listChat[index];
                            return chat;
                          },
                        ),
                        if (homeCon.loadingAsking) ...{
                          LoadingAnimationWidget.staggeredDotsWave(
                            color: const Color(0xFF8283BD),
                            size: 25,
                          )
                        },
                      ],
                    ),
                  ),
                ),
          Container(
            padding: const EdgeInsets.all(20).copyWith(top: 0),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  spreadRadius: -15,
                  color: AppColor.darkColor.withOpacity(0.2),
                ),
              ],
            ),
            child: CustomTextField(
              maxLines: null,
              controller: homeCon.textController,
              hintText: "Send a message",
              onTap: () async {
                if (homeCon.listChat.isNotEmpty) {
                  scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              prefixIconColor: context.theme.canvasColor,
              prefixIcon: homeCon.clearIcon
                  ? IconButton(
                      onPressed: () {
                        homeCon.clearIcon = false;
                        homeCon.textController.clear();
                        homeCon.update();
                      },
                      icon: const Icon(
                        Icons.clear_rounded,
                      ),
                    )
                  : null,
              style: AppTextStyle.txt15,
              enabledColor: context.theme.canvasColor,
              focusedColor: context.theme.canvasColor,
              fillColor: context.theme.highlightColor,
              onFieldSubmitted: (value) {
                homeCon.submit();
              },
              onChanged: (p0) {
                if (p0.trim().isNotEmpty) {
                  homeCon.clearIcon = true;
                } else {
                  homeCon.clearIcon = false;
                }
                homeCon.update();
              },
              suffixIcon: IconButton(
                onPressed: () {
                  homeCon.submit();
                },
                icon: Icon(
                  Icons.message,
                  color: context.iconColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
