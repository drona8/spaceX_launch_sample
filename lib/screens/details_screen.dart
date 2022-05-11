import 'package:flutter/material.dart';
import 'package:sampleapp/widgets/app_tile.dart';

import '../models/launch.dart';
import '../models/ship.dart';
import '../services/api.dart';
import '../style/styles.dart';
import '../utilities/app_constants.dart';
import '../utilities/app_utility.dart';
import '../widgets/common_widget.dart';

class DetailsScreen extends StatefulWidget {
  final String id;
  const DetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstant.detailsTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 15.0,
        ),
        child: FutureBuilder<Launch>(
          future: Api.getLaunchDetailsById(widget.id),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CommonWidget.circularProgressIndicator();
              default:
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (!snapshot.hasData) {
                  return const Text(AppConstant.invalidInputError);
                } else if (snapshot.data != null) {
                  Launch _launch = snapshot.data!;
                  return _getDetailsList(context, _launch);
                } else {
                  return const SizedBox.shrink();
                }
            }
          },
        ),
      ),
    );
  }

  Widget _getDetailsList(BuildContext context, Launch launch) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        CommonWidget.getResultRow(
          context,
          'Launch ID:',
          launch.id,
        ),
        CommonWidget.getResultRow(
          context,
          'Launch Name:',
          launch.launchName,
        ),
        CommonWidget.getResultRow(
          context,
          'Launch Date:',
          AppUtility.formateDate(launch.launchDate),
        ),
        CommonWidget.getResultRowList(
          context,
          'Rocket Status:',
          launch.rocketFirstStageCoreStatus,
        ),
        CommonWidget.getResultRow(
          context,
          'Ship Details',
          launch.ships == null ||
                  (launch.ships != null && launch.ships!.isEmpty)
              ? 'N/A'
              : '',
        ),
        launch.ships != null && launch.ships!.isNotEmpty
            ? _getShipItems(context, launch.ships!)
            : const SizedBox.shrink()
      ],
    );
  }

  Widget _getShipItems(BuildContext context, List<Ship> ships) {
    return Column(
      children: [for (Ship ship in ships) _getShipItem(context, ship)],
    );
  }

  Widget _getShipItem(BuildContext context, Ship ship) {
    return AppTile(ship: ship);
  }
}
