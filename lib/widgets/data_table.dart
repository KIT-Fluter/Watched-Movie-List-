import 'package:apex_legends_app/models/data_table_model.dart';
import 'package:apex_legends_app/widgets/edit_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DataTableWidget extends StatelessWidget {
  DataTableWidget(this.score, this.uid);
  final List score;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataTableModel(),
      child: Consumer<DataTableModel>(
        builder: (context, model, child) {
          return DataTable(
            columns: const <DataColumn>[
              DataColumn(
                label: Text(
                  '順位',
                ),
              ),
              DataColumn(
                label: Text(
                  'キル数',
                ),
              ),
              DataColumn(
                label: Text(
                  'ダメージ',
                ),
              ),
              DataColumn(
                label: Text(
                  'ポイント',
                ),
              ),
            ],
            rows: createRows(
                model.reversList(score), model.selected, model.a, context),
            showCheckboxColumn: false, //checkboxを表示させない
          );
        },
      ),
    );
  }

  //[[damage, kill, death], [damage, kill, death], [damage, kill, death]]
  List<DataRow> createRows(List rankResultArray, List<bool> selected,
      Function a, BuildContext context) {
    List<DataRow> dataRows = [];
    rankResultArray.asMap().forEach(
          (index, result) => {
            dataRows.add(
              DataRow(
                cells: <DataCell>[
                  DataCell(Text(result[0].toString())),
                  DataCell(Text(result[1].toString())),
                  DataCell(Text(result[2].toString())),
                  DataCell(Text(result[3].toString())),
                ],
                onSelectChanged: (bool value) {
                  a(index);
                  showModalBottomSheet(
                    context: context,
                    // ここに編集か追加かの引数を追加
                    builder: (context) => EditSheetWidget(uid),
                  );
                },
                selected: selected[index],
              ),
            ),
          },
        );

    return dataRows;
  }
}
