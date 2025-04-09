import 'package:task/core/helpers/string_helper.dart';

class AppValidator {
  static String? isPhoneNumber(String value) {
    if (value.trim().isEmpty) {
      return "Empty value";
    } else if (value.trim().length < 8) {
      return "Phone number length should be 9";
    }
    //  else if (GetUtils.isPhoneNumber(value) == false) {
    //   return 'Please enter valid phone number'.tr;
    // }
    else {
      return null;
    }
  }

  static String? isInteger(String value) {
    if (value.trim().isEmpty) {
      return "Empty value"; // Using easy_localization syntax
    } else if (value.trim().length > 11 ||
        !RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Invalid number';
    }
    return null;
  }

  static String? isPassword(String value) {
    if (value.trim().isEmpty) {
      return "Empty value";
    } else if (value.trim().length < 6) {
      return "Password length should be 9";
    } else {
      return null;
    }
  }

  static String? isStrongPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (value.trim().isEmpty) {
      return "Empty value";
    } else if (value.trim().length < 8) {
      return "Password length should be 8";
    } else if (!regExp.hasMatch(value)) {
      return 'Minimum 1 Upper case\nMinimum 1 lowercase\nMinimum 1 Numeric Number\nMinimum 1 Special Character';
    } else {
      return null;
    }
  }

  static String? isEmail(String value) {
    if (value.trim().isEmpty) {
      return "Empty value";
    } else if (RegExp(
                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
            .hasMatch(value) ==
        false) {
      return 'Email format is not correct';
    } else {
      return null;
    }
  }

  static String? isActivationCode(String? value) {
    if (value == null) {
      return "Empty value";
    } else if (value.trim().isEmpty) {
      return "Empty value";
    } else if (value.length != 4) {
      return "Active code length should be 4";
    } else {
      return null;
    }
  }

  static String? isHasValue(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Empty value";
    } else {
      return null;
    }
  }

  static String? isTitle(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Empty value";
    } else if(value.length > 28){
      return "Title is too long";
    } else {
      return null;
    }
  }

  static String? isDateAfterOtherDate(String value, DateTime date) {
    if (value.trim().isEmpty) {
      return "Empty value";
    } else if (DateTime.parse(value).isBefore(date)) {
      return "Date Must be Before ${date.toString().reformatDateOrEmpty()}";
    }
    return null;
  }
}
