import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_web_dashboard/constants/styles.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

/// Example without a datasource
class ClientsTable extends StatelessWidget {
  const ClientsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 6),
              color: kLightGrey.withOpacity(0.1),
              blurRadius: 12),
        ],
        border: Border.all(
          color: kLightGrey,
          width: 0.5,
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: DataTable2(
        columnSpacing: 12,
        horizontalMargin: 12,
        minWidth: 600,
        columns: const [
          DataColumn2(
            label: Text(
              'Name',
            ),
            size: ColumnSize.L,
          ),
          DataColumn(
            label: Text(
              'Location',
            ),
          ),
          DataColumn(
            label: Text(
              'Rating',
            ),
          ),
          DataColumn(
            label: Text(
              'Action',
            ),
          ),
        ],
        rows: List<DataRow>.generate(
          7,
          (index) => DataRow(cells: [
            const DataCell(
              CustomText(
                text: 'Block Client',
              ),
            ),
            const DataCell(
              CustomText(
                text: 'Yaounde',
              ),
            ),
            DataCell(
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.deepOrange,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  CustomText(
                    text: "4.$index",
                  )
                ],
              ),
            ),
            DataCell(
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kActive,
                    width: 0.5,
                  ),
                  color: kLight,
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: CustomText(
                  text: "Available Delivery",
                  color: kActive.withOpacity(
                    0.7,
                  ),
                  weight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
