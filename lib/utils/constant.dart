import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttering_phrases/fluttering_phrases.dart';
import 'package:gemdetector/utils/colors.dart';
import 'package:gemdetector/utils/Config_links.dart';
import 'package:gemdetector/utils/strings.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

List<String> attributives = [
  AppStrings.gemstoneFake,
  AppStrings.gemstoneReal,
];

final generatedTitle =
    generate(delimiter: '|', tokenRadix: 6, attributives: attributives);
List dataSplited = generatedTitle.split("|");
var finalSplitted = dataSplited[0].trim();

void showAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      var heightsize = MediaQuery.of(context).size.height;
      var widthsize = MediaQuery.of(context).size.width;
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        actions: [
          Column(
            children: [
              SizedBox(
                height: heightsize * 0.7,
                width: widthsize * 0.9,
                child: SafeArea(
                    child: Drawer(
                  child: ListView(
                    children: [
                      Container(
                        color: AppColors.primaryColor.withOpacity(.5),
                        child: DrawerHeader(
                          child: null,
                        ),
                        height: 50,
                      ),
                      listTile(AppStrings.home, Icons.home_outlined, () {
                        Navigator.pop(context);
                      }),
                      listTile(AppStrings.shareApp, Icons.share, () {
                        Share.share(LinksAppData.strAppLink);
                      }),
                      listTile(AppStrings.rateUs, Icons.star_border_outlined,
                          () {
                        final InAppReview inAppReview = InAppReview.instance;
                        inAppReview.openStoreListing(
                          appStoreId: LinksAppData.appStoreId,
                        );
                        inAppReview.requestReview();
                      }),
                      listTile(AppStrings.moreApps, Icons.apps_outlined, () {
                        moreApps();
                      }),
                      listTile(
                          AppStrings.privacyPolicy, Icons.privacy_tip_outlined,
                          () {
                        privacyPolicyUrl();
                      }),
                      listTile(AppStrings.exit, Icons.exit_to_app, () {
                        SystemNavigator.pop();
                      }),
                    ],
                  ),
                )),
              ),
            ],
          )
        ],
        backgroundColor: Colors.white,
      );
    },
  );
}

listTile(String title, IconData iconData, var ontapped) {
  return Column(
    children: [
      ListTile(
        leading: Icon(iconData),
        title: Text(
          title,
          style: const TextStyle(
              color: Color(0xFF4D4C4C),
              fontWeight: FontWeight.w600,
              fontSize: 16),
        ),
        onTap: ontapped,
      ),
      Padding(
        padding: EdgeInsets.only(left: 30, right: 50),
        child: Divider(),
      ),
    ],
  );
}

Future<void> privacyPolicyUrl() async {
  if (!await launchUrl(LinksAppData.urlPrivacy)) {
    throw 'Could not launch ${LinksAppData.urlPrivacy}';
  }
}

Future<void> moreApps() async {
  if (!await launchUrl(LinksAppData.urlMoreApps)) {
    throw 'Could not launch ${LinksAppData.urlMoreApps}';
  }
}
