import 'package:ai_app/models/UserModel.dart';
import 'package:ai_app/modules/home/components/chat_response.dart';
import 'package:ai_app/utils/helper/local_storage.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<String> dropdownItems = [];
  var textController = TextEditingController();
  var clearIcon = false;
  List<ChatResponse> listChat = [];
  String selectedItem = "";
  bool loadingAsking = false;
  bool show = false;
  int? selectedLanIndex;
  void getLangLocalStorage() {
    var language = LocalStorage.getIntData(key: "language");
    selectedLanIndex = language;
  }

  void onChanged(String value) {
    if (value.isNotEmpty) {
      show = true;
    } else {
      show = false;
    }
  }

  void clearChat() {
    listChat.clear();
  }

  void submit() {
    if (textController.text.trim().isNotEmpty) {
      clearIcon = false;
      var chatUser = ChatUserModel(
        text: textController.text.trim(),
        dateTime: DateTime.now(),
      );
      askChatBot(chatUser: chatUser);
      textController.clear();
    } else {
      Fluttertoast.showToast(msg: "Please Input Something");
    }
  }

  Future<void> askChatBot({
    required ChatUserModel chatUser,
  }) async {
    loadingAsking = true;
    try {
      listChat.add(
        ChatResponse(
          text: chatUser.text,
          responseAs: ResponseAs.human,
        ),
      );
    } catch (error) {
      debugPrint(
        'CatchError when askChatBot this is error : >> $error',
      );
    }
    loadingAsking = false;
  }

  Future<void> fetchModels() async {
    try {
      dropdownItems.clear();
    } catch (error) {
      debugPrint(
        'CatchError when fetchModels this is error : >> $error',
      );
    }
  }

  selectedItems(String item) {
    selectedItem = item;
  }

  updateLanguage(int index) {}

  changeLanguage(
    BuildContext context,
  ) async {
    var listText = [
      "English",
      "Khmer",
    ];
    var listFlags = [
      const Flag.fromString(
        "gb",
        width: 20,
        height: 20,
      ),
      const Flag.fromString(
        "kh",
        width: 20,
        height: 20,
      ),
    ];
    await showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        var homeProvider = HomeController();
        return Padding(
          padding: const EdgeInsets.all(15).copyWith(
            bottom: context.mediaQueryViewPadding.bottom,
          ),
          child: Wrap(
            children: List.generate(
              2,
              (index) {
                return ListTile(
                  leading: listFlags[index],
                  title: Text(listText[index]),
                  onTap: () async {
                    homeProvider.selectedLanIndex = index;
                    debugPrint("lang:${homeProvider.selectedLanIndex}");

                    Navigator.pop(context);
                    await LocalStorage.storeData(
                      key: "language",
                      value: homeProvider.selectedLanIndex,
                    );
                  },
                  trailing: Icon(
                    index == selectedLanIndex
                        ? Icons.circle_rounded
                        : Icons.circle_outlined,
                    size: 15,
                    color: Colors.green,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
