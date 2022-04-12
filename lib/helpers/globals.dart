import 'package:flutter/material.dart';

class Globals {
  static const encryptionKey =
      'this-is-just-simple-secret-key-to-encrypt-data-locally-please-change-it-time-to-time-for-better-security'; // needed to be set from server
  static const imageUrl = 'https://greatpatriots.webredirect.org/images/';
  static const baseurl = 'https://greatpatriots.webredirect.org';
  static const List<Locale> suppoortedLocales = [
    Locale('en', 'US'),
    Locale('sk', 'SK'),
  ];
}

class Gcolors {
  static const backgroundColor = Color(0xff768bad);
  static const greyColor = Color(0xffDCDCDC);
}
