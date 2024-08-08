import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:inventory_management/controller/home/home_controller.dart';
import 'package:inventory_management/core/constants/app_colors.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeController>(context, listen: false).loadItems();
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        key: _key,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: ()=>_key.currentState!.openDrawer(),
            icon: Icon(Icons.menu),
            color: AppColors.white,
          ),
          backgroundColor: Colors.transparent,
          bottom: TabBar(
            indicator:
                BoxDecoration(border: Border.all(color: Colors.transparent)),
            isScrollable: true,
            tabs: [
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: EdgeInsets.only(bottom: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Text(
                  'Details',
                  style: GoogleFonts.allerta(color: AppColors.black),
                ),
              )
            ],
          ),
        ),
        drawer: const Drawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(108, 108, 108, 0.25),
                          borderRadius: BorderRadius.circular(30)),
                      // child: TextField(
                      //   decoration: InputDecoration(
                      //       prefixIcon: Icon(
                      //         Icons.search,
                      //         color: AppColors.black,
                      //       ),
                      //       border: InputBorder.none,
                      //       hintText: 'Search',
                      //       hintStyle: TextStyle(fontWeight: FontWeight.w600)),
                      // )
                      child: TypeAheadField(
                        builder: (context, controller, focusNode) {
                          return TextField(
                            controller: controller,
                            focusNode: focusNode,
                            autofocus: true,
                            style: TextStyle(color: AppColors.white),
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: AppColors.black,
                                ),
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.w600)),
                          );
                        },
                        controller: controller.searchController,
                        suggestionsCallback: (pattern) {
                          return controller.getSuggestions(pattern);
                        },
                        emptyBuilder: (context){
                          return Container(
                            height: size.height * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.black,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Center(
                              child: Text('No Search Found', style: TextStyle(color: AppColors.white),),
                            ),
                          );
                        },
                        itemBuilder: (context, suggestion) {
                          return ListTile(
                            tileColor: AppColors.black,
                            title: Text(
                              suggestion,
                              style: TextStyle(color: AppColors.white),
                            ),
                          );
                        },

                        // transitionBuilder: (context, suggestionsBox, controller) {
                        //   return suggestionsBox;
                        // },
                        onSelected: (value) {
                          controller.searchController.text = value;
                          controller.searchBarcode(value);
                        },
                      )),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  InkWell(
                      onTap: ()=> controller.clearController(),
                      child: Text(
                        'clear',
                        style: TextStyle(color: Colors.blue),
                      ))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.7,
                    child: StaggeredGrid.count(
                      crossAxisCount: 5,
                      mainAxisSpacing: 4,
                      // maxCrossAxisExtent: 200,
                      children: [
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.barcodeNo,
                            labelText: 'Barcode No.',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.location,
                            labelText: 'Location',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.branch,
                            labelText: 'Branch',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.status,
                            labelText: 'Status',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.counter,
                            labelText: 'Counter',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.source,
                            labelText: 'Source',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.category,
                            labelText: 'Category',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.collection,
                            labelText: 'Collection',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 2,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.description,
                            labelText: 'Description',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.metalGrp,
                            labelText: 'Metal Grp',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.stkSection,
                            labelText: 'STK Section',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.mfgdBy,
                            labelText: 'Mfgd By',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 2,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.notes,
                            labelText: 'Notes',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.stkSince,
                            labelText: 'In STK Since',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.certNo,
                            labelText: 'Cert No.',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.huidNo,
                            labelText: 'HUID No.',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: Container(
                              child: ItemDetailsField(
                            controller: controller.orderNo,
                            labelText: 'Order No.',
                          )),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.cusName,
                            labelText: 'Cus Name',
                          ),
                        )
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      width: size.width * 0.16,
                      height: 210,
                      child: Image.network(
                        controller.imageLink,
                        fit: BoxFit.cover,
                        errorBuilder: (context, exception, stackTree) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                            ),
                            child: Center(
                              child: Text('No Image'),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size.width * 0.84,
                    child: StaggeredGrid.count(
                      crossAxisCount: 6,
                      mainAxisSpacing: 4,
                      // maxCrossAxisExtent: 200,
                      children: [
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.size,
                            labelText: 'Size',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.quality,
                            labelText: 'Quality',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.kt,
                            labelText: 'KT',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.pcs,
                            labelText: 'Pcs',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.grossWt,
                            labelText: 'Gross Wt',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: Container(
                              child: ItemDetailsField(
                            controller: controller.netWt,
                            labelText: 'Net Wt',
                          )),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.diaPcs,
                            labelText: 'Dia Pcs',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.diaWt,
                            labelText: 'Dia Wt',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.clsPcs,
                            labelText: 'Cls Pcs',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.clsWt,
                            labelText: 'Cls Wt',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.chainWt,
                            labelText: 'Chain Wt',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.mRate,
                            labelText: 'M Rate',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.mValue,
                            labelText: 'M Value',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.lRate,
                            labelText: 'L Rate',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.lCharges,
                            labelText: 'L Charges',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.rCharges,
                            labelText: 'R Charges',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.oCharges,
                            labelText: 'O Charges',
                          ),
                        ),
                        StaggeredGridTile.fit(
                          crossAxisCellCount: 1,
                          // mainAxisCellCount: 1,
                          child: ItemDetailsField(
                            controller: controller.mrp,
                            labelText: 'MRP',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.03,
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //   width: 1,
                      // ),
                      // borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                  child: DataTable(
                    columnSpacing: 70,
                    headingRowColor: MaterialStatePropertyAll<Color>(
                        AppColors.white.withOpacity(0.4)),
                    dataRowColor: MaterialStatePropertyAll<Color>(
                        AppColors.white.withOpacity(0.2)),
                    columns: const [
                      DataColumn(
                          label: Text(
                        'LOT Description',
                        style: TextStyle(color: AppColors.white),
                      )),
                      DataColumn(
                          label: Text('Group',
                              style: TextStyle(color: AppColors.white))),
                      DataColumn(
                          label: Text('Units',
                              style: TextStyle(color: AppColors.white))),
                      DataColumn(
                          label: Text('Pcs',
                              style: TextStyle(color: AppColors.white))),
                      DataColumn(
                          label: Text('Weight',
                              style: TextStyle(color: AppColors.white))),
                      DataColumn(
                          label: Text('Rate',
                              style: TextStyle(color: AppColors.white))),
                      DataColumn(
                          label: Text('Value',
                              style: TextStyle(color: AppColors.white))),
                      DataColumn(
                          label: Text('S Rate',
                              style: TextStyle(color: AppColors.white))),
                      DataColumn(
                          label: Text('S Value',
                              style: TextStyle(color: AppColors.white))),
                    ],
                    rows: controller.tableData.map((tableData) {
                      return controller.tableData == [] ? DataRow(cells: []) :DataRow(cells: [
                        DataCell(Text(tableData.lotDescription, style: TextStyle(color: AppColors.white))),
                        DataCell(Text(tableData.group, style: TextStyle(color: AppColors.white))),
                        DataCell(Text(tableData.units, style: TextStyle(color: AppColors.white))),
                        DataCell(Text(tableData.pcs.toString(), style: TextStyle(color: AppColors.white))),
                        DataCell(Text(tableData.weight.toString(), style: TextStyle(color: AppColors.white))),
                        DataCell(Text(tableData.rate.toString(), style: TextStyle(color: AppColors.white))),
                        DataCell(Text(tableData.value.toString(), style: TextStyle(color: AppColors.white))),
                        DataCell(Text(tableData.sRate.toString(), style: TextStyle(color: AppColors.white))),
                        DataCell(Text(tableData.sValue.toString(), style: TextStyle(color: AppColors.white))),
                      ]);
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemDetailsField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  const ItemDetailsField({
    this.controller,
    required this.labelText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.15,

      alignment: Alignment.center,
      height: 50,
      margin: EdgeInsets.only(left: 10),
      padding: EdgeInsets.only(left: 16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        border: GradientBoxBorder(gradient: AppColors.textFieldGradientBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        readOnly: true,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w300,
            color: Color.fromRGBO(255, 255, 255, 1)),
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: Color.fromRGBO(255, 255, 255, 0.8))),
      ),
    );
  }
}
