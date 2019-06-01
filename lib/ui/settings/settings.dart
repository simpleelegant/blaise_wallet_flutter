import 'dart:ui';

import 'package:blaise_wallet_flutter/appstate_container.dart';
import 'package:blaise_wallet_flutter/ui/util/app_icons.dart';
import 'package:blaise_wallet_flutter/ui/util/text_styles.dart';
import 'package:blaise_wallet_flutter/ui/widgets/auto_resize_text.dart';
import 'package:blaise_wallet_flutter/ui/widgets/settings_list_item.dart';
import 'package:flutter/material.dart';

class IntroSettingsPage extends StatefulWidget {
  @override
  _IntroSettingsPageState createState() => _IntroSettingsPageState();
}

class _IntroSettingsPageState extends State<IntroSettingsPage> {
  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              color: StateContainer.of(context).curTheme.overlay20,
              child: GestureDetector(
                onTap: () {
                  return null;
                },
                // Custom modal
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 120,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.6,
                    ),
                    decoration: BoxDecoration(
                      color:
                          StateContainer.of(context).curTheme.backgroundPrimary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: <Widget>[
                        // Header of the modal
                        Container(
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                            gradient: StateContainer.of(context)
                                .curTheme
                                .gradientPrimary,
                          ),
                          child: Container(
                            margin:
                                EdgeInsetsDirectional.fromSTEB(24, 16, 24, 16),
                            child: AutoSizeText(
                              "Header",
                              style: AppStyles.modalHeader(context),
                              maxLines: 1,
                              stepGranularity: 0.1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
    );
    overlayState.insert(overlayEntry);
  }

  var _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // The main scaffold that holds everything
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      backgroundColor: StateContainer.of(context).curTheme.backgroundPrimary,
      body: LayoutBuilder(
        builder: (context, constraints) => Stack(
              children: <Widget>[
                // Container for the gradient background
                Container(
                  height: 104 +
                      (MediaQuery.of(context).padding.top) +
                      (36 - (MediaQuery.of(context).padding.top) / 2),
                  decoration: BoxDecoration(
                    gradient:
                        StateContainer.of(context).curTheme.gradientPrimary,
                  ),
                ),
                // Column for the rest
                Column(
                  children: <Widget>[
                    // Container for the header and button
                    Container(
                      margin: EdgeInsetsDirectional.only(
                        top: (MediaQuery.of(context).padding.top) +
                            (36 - (MediaQuery.of(context).padding.top) / 2),
                        bottom: 8,
                      ),
                      // Row for back button and the header
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          // Back Button
                          Container(
                            margin: EdgeInsetsDirectional.only(start: 2),
                            height: 50,
                            width: 50,
                            child: FlatButton(
                                highlightColor: StateContainer.of(context)
                                    .curTheme
                                    .textLight15,
                                splashColor: StateContainer.of(context)
                                    .curTheme
                                    .textLight30,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0)),
                                padding: EdgeInsets.all(0.0),
                                child: Icon(AppIcons.back,
                                    color: StateContainer.of(context)
                                        .curTheme
                                        .textLight,
                                    size: 24)),
                          ),
                          // The header
                          Container(
                            width: MediaQuery.of(context).size.width - 100,
                            margin: EdgeInsetsDirectional.fromSTEB(4, 0, 24, 0),
                            child: AutoSizeText(
                              "Settings",
                              style: AppStyles.header(context),
                              maxLines: 1,
                              stepGranularity: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded list
                    Expanded(
                      // Container for the list
                      child: Container(
                        margin: EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: StateContainer.of(context)
                              .curTheme
                              .backgroundPrimary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          boxShadow: [
                            StateContainer.of(context)
                                .curTheme
                                .shadowSettingsList,
                          ],
                        ),
                        // Settings List
                        child: ListView(
                          padding: EdgeInsetsDirectional.only(
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 12),
                          children: <Widget>[
                            // Preferences text
                            Container(
                              alignment: Alignment(-1, 0),
                              margin: EdgeInsetsDirectional.only(
                                  start: 24, end: 24, top: 16, bottom: 8),
                              child: AutoSizeText(
                                "Preferences",
                                style: AppStyles.settingsHeader(context),
                                maxLines: 1,
                                stepGranularity: 0.1,
                              ),
                            ),
                            // Divider
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                            // List Items
                            SettingsListItem(
                              header: "Currency",
                              subheader: "\$ US Dollar",
                              icon: AppIcons.currency,
                              onPressed: () {
                                showOverlay(context);
                              },
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                            SettingsListItem(
                              header: "Language",
                              subheader: "System Default",
                              icon: AppIcons.language,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                            SettingsListItem(
                              header: "Theme",
                              subheader: "Light",
                              icon: AppIcons.theme,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                            SettingsListItem(
                              header: "Security",
                              icon: AppIcons.security,
                              onPressed: () {
                                Navigator.pushNamed(context, '/security');
                              },
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                            // Manage text
                            Container(
                              alignment: Alignment(-1, 0),
                              margin: EdgeInsetsDirectional.only(
                                  start: 24, end: 24, top: 16, bottom: 8),
                              child: AutoSizeText(
                                "Manage",
                                style: AppStyles.settingsHeader(context),
                                maxLines: 1,
                                stepGranularity: 0.1,
                              ),
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                            SettingsListItem(
                              header: "Contacts",
                              icon: AppIcons.contacts,
                              onPressed: () {
                                Navigator.pushNamed(context, '/contacts');
                              },
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                            SettingsListItem(
                              header: "Backup Private Key",
                              icon: AppIcons.backupprivatekey,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                            SettingsListItem(
                              header: "Share Blaise",
                              icon: AppIcons.share,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                            SettingsListItem(
                              header: "Logout",
                              icon: AppIcons.logout,
                            ),
                            Container(
                              width: double.maxFinite,
                              height: 1,
                              color: StateContainer.of(context)
                                  .curTheme
                                  .textDark10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      ),
    );
  }
}