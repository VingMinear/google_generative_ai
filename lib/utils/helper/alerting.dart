import 'package:ai_app/style/app_color.dart';
import 'package:ai_app/style/app_textstyle.dart';
import 'package:flutter/material.dart';
import '../controller/global_key.dart';

void alertErrorSnackbar({
  required title,
  required message,
}) {
  final SnackBar snackBarError = SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.all(10),
    duration: const Duration(milliseconds: 1600),
    behavior: SnackBarBehavior.floating,
    content: SizedBox(
      width: double.infinity,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppTextStyle.txt14.copyWith(color: Colors.white),
              ),
              Text(
                message,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.txt12.copyWith(color: Colors.white),
              ),
            ],
          ),
          const Icon(
            Icons.clear,
            color: Colors.white,
          ),
        ],
      ),
    ),
    backgroundColor: Colors.red,
  );
  snackBarKey.currentState?.showSnackBar(snackBarError);
}

void alertSuccessSnackbar({
  required title,
  required message,
}) {
  final SnackBar snackBarSuccess = SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    margin: const EdgeInsets.all(10),
    duration: const Duration(milliseconds: 1600),
    behavior: SnackBarBehavior.floating,
    content: GestureDetector(
      child: SizedBox(
        width: double.infinity,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: AppTextStyle.txt14.copyWith(color: Colors.white),
                ),
                Text(
                  message,
                  style: AppTextStyle.txt12.copyWith(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            const Icon(
              Icons.check,
              color: Colors.white,
            ),
          ],
        ),
      ),
    ),
    backgroundColor: Colors.green,
  );
  snackBarKey.currentState?.showSnackBar(snackBarSuccess);
}

void alertSnackbarCustom({
  required message,
  double height = 20,
  Widget? prefix,
  Color? backgroundColor,
}) {
  final SnackBar snackBarSuccess = SnackBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(3),
    ),
    margin: const EdgeInsets.all(10),
    duration: const Duration(milliseconds: 1600),
    behavior: SnackBarBehavior.floating,
    content: SizedBox(
      width: double.infinity,
      height: height,
      child: Row(
        children: [
          prefix ??= const SizedBox.shrink(),
          const SizedBox(width: 10),
          Text(
            message,
            style: AppTextStyle.txt14
                .copyWith(color: Colors.white, fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
    backgroundColor: backgroundColor ?? const Color(0xFF3B4D8D),
  );
  snackBarKey.currentState?.showSnackBar(snackBarSuccess);
}

BuildContext? dialogContext;
showDialogConfirmation({
  required BuildContext context,
  required String txt,
  required String accept,
  required String cancel,
  GestureTapCallback? onTapCancel,
  GestureTapCallback? onTapAccept,
}) async {
  showDialog(
    context: context,
    builder: (context) {
      dialogContext = context;
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        insetPadding: const EdgeInsets.symmetric(horizontal: 0),
        actionsPadding: const EdgeInsets.all(20),
        contentPadding: const EdgeInsets.only(
          left: 28,
          right: 28,
          top: 15,
        ),
        title: Text(
          "Confirmation",
          textAlign: TextAlign.center,
          style: AppTextStyle.txt16.copyWith(
            color: AppColor.darkColor,
          ),
        ),
        content: Text(
          "Are you sure, you want to $txt ?",
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: AppColor.darkColor,
          ),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          GestureDetector(
            onTap: onTapCancel,
            child: Text(
              cancel,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: onTapAccept,
            child: Text(
              accept,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      );
    },
  );
}
