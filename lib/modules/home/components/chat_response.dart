import 'package:ai_app/style/app_textstyle.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../utils/widget/custom_avartar.dart';

enum ResponseAs {
  human,
  bot,
}

class ChatResponse extends StatelessWidget {
  const ChatResponse({
    super.key,
    required this.text,
    required this.responseAs,
  });
  final String text;
  final ResponseAs responseAs;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      textDirection: responseAs == ResponseAs.human
          ? TextDirection.rtl
          : TextDirection.ltr,
      children: [
        responseAs == ResponseAs.human
            ? const CustomAvatar(
                size: 40,
                imgUrl:
                    "https://lh3.googleusercontent.com/a/AAcHTtcFBSTxsFGglWTNzd-aqEkkqq9qUoxS7GD19zR0bg=s576-c-no",
              )
            : const CustomAvatar(
                size: 40,
                imgPath: "assets/logo/chatGPT.png",
              ),
        const SizedBox(width: 10),
        Flexible(
          child: GestureDetector(
            onLongPress: () async {
              await Clipboard.setData(ClipboardData(text: text));
              Fluttertoast.showToast(
                msg: "Text Copied to Clipboard",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white.withOpacity(0.2),
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: responseAs == ResponseAs.human
                    ? Colors.green.shade300
                    : context.theme.highlightColor,
                borderRadius: BorderRadius.circular(15).copyWith(
                    // bottomLeft: Radius.zero,
                    ),
              ),
              child: DefaultTextStyle(
                style: AppTextStyle.txt15,
                child: responseAs == ResponseAs.human
                    ? Text(
                        text,
                      )
                    : AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            text,
                            speed:
                                Duration(milliseconds: duration(text.length)),
                            cursor: "",
                          ),
                        ],
                        totalRepeatCount: 1,
                        repeatForever: false,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  int duration(int length) {
    if (length < 50) {
      return 50;
    } else if (length < 130) {
      return 46;
    } else if (length < 170) {
      return 43;
    } else {
      return 34;
    }
  }
}
