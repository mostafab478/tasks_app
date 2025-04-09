class StringHelper {
  final String value;
  final int length;

  StringHelper(this.value, this.length);

  String showMore(bool more) {
    if (more) {
      return value;
    } else if (value.length <= length) {
      return value;
    } else {
      return '${value.substring(0, length)} ...';
    }
  }
}

String? removeLastChars(String? s,int countToRemove) {
  return (s == null || s.isEmpty)
      ? null
      : (s.substring(0, s.length - countToRemove));
}

bool isNumeric(String? str) {
  if (str == null) {
    return false;
  }
  return double.tryParse(str) != null;
}

bool validateEmail(String value) {
  String patttern = r'[\w-]+@([\w-]+\.)+[\w-]+';
  RegExp regExp = RegExp(patttern);
  if (value.isEmpty) {
    return false;
  } else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

bool validatePhone(String value) {
  var length = value.length;
  if (length < 9 || length > 11 || int.tryParse(value.trim()) == null) {
    return false;
  }
  return true;
}


String getSubString(String value, maxLength, {dotes = ''}) {
  return (value.length > maxLength
      ? value.substring(0, maxLength) + dotes
      : value);
}
extension StringExtension on String {
    String capitalize() {
      return "${this[0].toUpperCase()}${substring(1)}";
    }
    String reformatDateOrEmpty() {
      if (isEmpty || this == "null") return '';
      DateTime date = DateTime.parse(this);
      final reformatted =
          '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      return reformatted;
    }
}
