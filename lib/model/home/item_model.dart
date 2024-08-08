class Item {
  final String barcode;
  final String location;
  final String branch;
  final String status;
  final int counter;
  final String source;
  final String category;
  final String collection;
  final String description;
  final String metalGrp;
  final String stkSection;
  final String mfgdBy;
  final String notes;
  final String inStkSince;
  final String certNo;
  final String huidNo;
  final int orderNo;
  final String cusName;
  final String size;
  final String quality;
  final double kt;
  final int pcs;
  final double grossWt;
  final double netWt;
  final int diaPcs;
  final double diaWt;
  final int clsPcs;
  final double clsWt;
  final double chainWt;
  final double mRate;
  final double mValue;
  final double lRate;
  final double lCharges;
  final double rCharges;
  final double oCharges;
  final double mrp;
  final String imageLink;
  final List<TableData> tableData;

  Item({
    required this.barcode,
    required this.location,
    required this.branch,
    required this.status,
    required this.counter,
    required this.source,
    required this.category,
    required this.collection,
    required this.description,
    required this.metalGrp,
    required this.stkSection,
    required this.mfgdBy,
    required this.notes,
    required this.inStkSince,
    required this.certNo,
    required this.huidNo,
    required this.orderNo,
    required this.cusName,
    required this.size,
    required this.quality,
    required this.kt,
    required this.pcs,
    required this.grossWt,
    required this.netWt,
    required this.diaPcs,
    required this.diaWt,
    required this.clsPcs,
    required this.clsWt,
    required this.chainWt,
    required this.mRate,
    required this.mValue,
    required this.lRate,
    required this.lCharges,
    required this.rCharges,
    required this.oCharges,
    required this.mrp,
    required this.imageLink,
    required this.tableData,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      barcode: json['Barcode'],
      location: json['Location'],
      branch: json['Branch'],
      status: json['Status'],
      counter: json['Counter'],
      source: json['Source'],
      category: json['Category'],
      collection: json['Collection'],
      description: json['Description'],
      metalGrp: json['Metal_Grp'],
      stkSection: json['STK_Section'],
      mfgdBy: json['Mfgd_By'],
      notes: json['Notes'],
      inStkSince: json['In_STK_Since'],
      certNo: json['Cert_No'],
      huidNo: json['HUID_No'],
      orderNo: json['Order_No'],
      cusName: json['Cus_Name'],
      size: json['Size'],
      quality: json['Quality'],
      kt: json['KT'].toDouble(),
      pcs: json['Pcs'],
      grossWt: json['Gross_Wt'].toDouble(),
      netWt: json['Net_Wt'].toDouble(),
      diaPcs: json['Dia_Pcs'],
      diaWt: json['Dia_Wt'].toDouble(),
      clsPcs: json['Cls_Pcs'],
      clsWt: json['Cls_Wt'].toDouble(),
      chainWt: json['Chain_Wt'].toDouble(),
      mRate: json['M_Rate'].toDouble(),
      mValue: json['M_Value'].toDouble(),
      lRate: json['L_Rate'].toDouble(),
      lCharges: json['L_Charges'].toDouble(),
      rCharges: json['R_Charges'].toDouble(),
      oCharges: json['O_Charges'].toDouble(),
      mrp: json['MRP'].toDouble(),
      imageLink: json['image_link'],
      tableData: (json['Table_Data'] as List)
          .map((i) => TableData.fromJson(i))
          .toList(),
    );
  }
  factory Item.defaultItem() {
    return Item(
      barcode: '',
      location: '',
      branch: '',
      status: '',
      counter: 0,
      source: '',
      category: '',
      collection: '',
      description: '',
      metalGrp: '',
      stkSection: '',
      mfgdBy: '',
      notes: '',
      inStkSince: '',
      certNo: '',
      huidNo: '',
      orderNo: 0,
      cusName: '',
      size: '',
      quality: '',
      kt: 0,
      pcs: 0,
      grossWt: 0,
      netWt: 0,
      diaPcs: 0,
      diaWt: 0,
      clsPcs: 0,
      clsWt: 0,
      chainWt: 0,
      mRate: 0,
      mValue: 0,
      lRate: 0,
      lCharges: 0,
      rCharges: 0,
      oCharges: 0,
      mrp: 0,
      imageLink: '',
      tableData: [],
    );
  }
}

class TableData {
  final String lotDescription;
  final String group;
  final String units;
  final int pcs;
  final double weight;
  final double rate;
  final double value;
  final double sRate;
  final double sValue;

  TableData({
    required this.lotDescription,
    required this.group,
    required this.units,
    required this.pcs,
    required this.weight,
    required this.rate,
    required this.value,
    required this.sRate,
    required this.sValue,
  });

  factory TableData.fromJson(Map<String, dynamic> json) {
    return TableData(
      lotDescription: json['Lot_Description'],
      group: json['Group'],
      units: json['Units'],
      pcs: json['Pcs'],
      weight: json['Weight'].toDouble(),
      rate: json['Rate'].toDouble(),
      value: json['Value'].toDouble(),
      sRate: json['S_Rate'].toDouble(),
      sValue: json['S_Value'].toDouble(),
    );
  }
}
