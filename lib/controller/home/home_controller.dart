import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import '../../model/home/item_model.dart';

class HomeController extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  final TextEditingController barcodeNo = TextEditingController();
  final TextEditingController location = TextEditingController();
  final TextEditingController branch = TextEditingController();
  final TextEditingController status = TextEditingController();
  final TextEditingController counter = TextEditingController();
  final TextEditingController source = TextEditingController();
  final TextEditingController category = TextEditingController();
  final TextEditingController collection = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController metalGrp = TextEditingController();
  final TextEditingController stkSection = TextEditingController();
  final TextEditingController mfgdBy = TextEditingController();
  final TextEditingController notes = TextEditingController();
  final TextEditingController stkSince = TextEditingController();
  final TextEditingController certNo = TextEditingController();
  final TextEditingController huidNo = TextEditingController();
  final TextEditingController orderNo = TextEditingController();
  final TextEditingController cusName = TextEditingController();

  final TextEditingController size = TextEditingController();
  final TextEditingController quality = TextEditingController();
  final TextEditingController kt = TextEditingController();
  final TextEditingController pcs = TextEditingController();
  final TextEditingController grossWt = TextEditingController();
  final TextEditingController netWt = TextEditingController();
  final TextEditingController diaPcs = TextEditingController();
  final TextEditingController clsPcs = TextEditingController();
  final TextEditingController clsWt = TextEditingController();
  final TextEditingController chainWt = TextEditingController();
  final TextEditingController mRate = TextEditingController();
  final TextEditingController mValue = TextEditingController();
  final TextEditingController lRate = TextEditingController();
  final TextEditingController lCharges = TextEditingController();
  final TextEditingController rCharges = TextEditingController();
  final TextEditingController oCharges = TextEditingController();
  final TextEditingController mrp = TextEditingController();
  final TextEditingController diaWt = TextEditingController();
  String imageLink = "";
  List<TableData> tableData = [];
  List<Item> items = [];
  Item? selectedItem;
  // final TextEditingController _controller = TextEditingController();

  Future<void> loadItems() async {
    final jsonString = await rootBundle.loadString('assets/json/data.json');
    final List<dynamic> jsonResponse = json.decode(jsonString)['Items'];
    items = jsonResponse.map((data) => Item.fromJson(data)).toList();

  }

  List<String> getSuggestions(String query) {
    List<String> matches = [];
    // if(query.isNotEmpty){
      for (var barcode in items) {
        if (barcode.barcode.toLowerCase().contains(query.toLowerCase())) {
          matches.add(barcode.barcode);
        }
      // }
    }
    return matches;
  }

  void searchBarcode(String barcode) {
    final foundItem = items.firstWhere((item) => item.barcode.contains(barcode),
        orElse: () => Item.defaultItem());
    selectedItem = foundItem;
    barcodeNo.text = selectedItem!.barcode.toString();
    location.text = selectedItem!.location.toString();
    branch.text = selectedItem!.branch.toString();
    status.text = selectedItem!.status.toString();
    counter.text = selectedItem!.counter.toString();
    source.text = selectedItem!.source.toString();
    category.text = selectedItem!.category.toString();
    collection.text = selectedItem!.collection.toString();
    description.text = selectedItem!.description.toString();
    metalGrp.text = selectedItem!.metalGrp.toString();
    stkSection.text = selectedItem!.stkSection.toString();
    mfgdBy.text = selectedItem!.mfgdBy.toString();
    notes.text = selectedItem!.notes.toString();
    stkSince.text = selectedItem!.inStkSince.toString();
    certNo.text = selectedItem!.certNo.toString();
    huidNo.text = selectedItem!.huidNo.toString();
    orderNo.text = selectedItem!.orderNo.toString();
    cusName.text = selectedItem!.cusName.toString();
    size.text = selectedItem!.size.toString();
    quality.text = selectedItem!.quality.toString();
    kt.text = selectedItem!.kt.toStringAsFixed(2);
    pcs.text = selectedItem!.pcs.toString();
    grossWt.text = selectedItem!.grossWt.toStringAsFixed(2);
    netWt.text = selectedItem!.netWt.toStringAsFixed(2);
    diaPcs.text = selectedItem!.diaPcs.toString();
    diaWt.text = selectedItem!.diaWt.toStringAsFixed(2);
    clsPcs.text = selectedItem!.clsPcs.toString();
    clsWt.text = selectedItem!.clsWt.toStringAsFixed(2);
    chainWt.text = selectedItem!.chainWt.toStringAsFixed(2);
    mRate.text = selectedItem!.mRate.toStringAsFixed(2);
    mValue.text = selectedItem!.mValue.toStringAsFixed(2);
    lRate.text = selectedItem!.lRate.toStringAsFixed(2);
    lCharges.text = selectedItem!.lCharges.toStringAsFixed(2);
    rCharges.text = selectedItem!.rCharges.toStringAsFixed(2);
    oCharges.text = selectedItem!.oCharges.toStringAsFixed(2);
    mrp.text = selectedItem!.mrp.toStringAsFixed(2);
    imageLink = selectedItem!.imageLink;
    tableData = selectedItem!.tableData;
    notifyListeners();
  }

  void clearController(){
    searchController.clear();
    barcodeNo.clear();
    location.clear();
    branch.clear();
    status.clear();
    counter.clear();
    source.clear();
    category.clear();
    collection.clear();
    description.clear();
    metalGrp.clear();
    stkSection.clear();
    mfgdBy.clear();
    notes.clear();
    stkSince.clear();
    certNo.clear();
    huidNo.clear();
    orderNo.clear();
    cusName.clear();
    size.clear();
    quality.clear();
    kt.clear();
    pcs.clear();
    grossWt.clear();
    netWt.clear();
    diaPcs.clear();
    diaWt.clear();
    clsPcs.clear();
    clsWt.clear();
    chainWt.clear();
    mRate.clear();
    mValue.clear();
    lRate.clear();
    lCharges.clear();
    rCharges.clear();
    oCharges.clear();
    mrp.clear();
    imageLink = "";
    tableData = [];
    notifyListeners();
  }
}
