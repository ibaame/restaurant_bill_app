// ignore_for_file: depend_on_referenced_packages

String getDate(DateTime dateTime) {
  return "${dateTime.year}-${dateTime.month}-${dateTime.day}";
}

String getDateTime(DateTime dateTime) {
  return "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
}
