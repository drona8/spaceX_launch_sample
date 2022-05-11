import 'package:flutter/material.dart';
import 'package:sampleapp/widgets/app_cached_network_image.dart';

import '../models/ship.dart';
import '../style/styles.dart';

class AppTile extends StatelessWidget {
  final Ship ship;
  const AppTile({
    Key? key,
    required this.ship,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getTile(context, ship);
  }

  Widget _getTile(BuildContext context, Ship ship) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      shadowColor: const Color.fromRGBO(105, 105, 105, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: AppCachedNetworkImage(
            imageURL: ship.image != null ? ship.image! : '',
            fit: BoxFit.fitWidth,
            color: colorblack,
          ),
        ),
        isThreeLine: true,
        title: Text(
          ship.name != null
              ? '${ship.name!} (${ship.id != null ? ship.id! : 'N/A'})'
              : 'N/A',
          style: listTileTitleStyle(),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              ship.homePort!,
              style: listTileTitleStyle(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getFooterElement('MMSI: ',
                    ship.mmsi != null ? ship.mmsi!.toString() : 'N/A'),
                _getFooterElement(
                    'Status: ',
                    ship.status != null && ship.status!.isNotEmpty
                        ? ship.status!.toString()
                        : 'N/A'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _getFooterElement(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: listTileTitleStyle(),
        ),
        Text(
          value,
          style: textStylesmBlackbPR(),
        ),
      ],
    );
  }
}
