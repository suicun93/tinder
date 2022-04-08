import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

part 'style.dart';

enum Environment { production, test, dev }

// Base URL
var currentEnvironment = Environment.production;

String get endpointApi => _environmentsMap[currentEnvironment] ?? '';

const Map<Environment, String> _environmentsMap = {
  Environment.production: 'https://dev-resumo.com/api/',
  Environment.dev: 'hihi',
  Environment.test: 'hihi',
};

// Use this photo if user don't have avatar
const noPhoto = 'images/noPhoto.jpeg';

// Valid date
DateTime _valid(DateTime dateTime) => (dateTime).toLocal();

// Format date
final _formatterFullDate = DateFormat('dd/MM/yyyy');
final _formatterMonthYear1 = DateFormat('yyyy年 MM月');

String? formatterFullDate(DateTime? dateTime) =>
    dateTime == null ? null : _formatterFullDate.format(dateTime);

String formatterMonthYear1(DateTime dateTime) =>
    _formatterMonthYear1.format(_valid(dateTime));

// Format money
final numberFormatter = NumberFormat('#,###');

copyToClipboard(String text) async {
  await Clipboard.setData(ClipboardData(text: text));
  showSnackBar('Copied $text');
}

bool get isTablet =>
    sqrt((Get.size.width * Get.size.width) +
        (Get.size.height * Get.size.height)) >
    1100;

bool get displayMobile => false;

final size =
    Get.size.width < Get.size.height ? Get.size.width : Get.size.height;

void showSnackBar(String message) => {
      Get.snackbar(
        '',
        '',
        titleText: Container(),
        messageText: Text(message),
        dismissDirection: DismissDirection.horizontal,
        isDismissible: true,
        snackPosition: SnackPosition.BOTTOM,
      )
    };
