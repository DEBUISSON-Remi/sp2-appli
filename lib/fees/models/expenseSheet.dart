import 'dart:ffi';

import 'employee.dart';
import 'sheetState.dart';

class ExpenseSheet {
  int id;
  int ref;
  Float calculatedAmount;
  String unit;
  String creationDate;
  String modificationDate;
  Employee employee;
  SheetState sheetState;
}
