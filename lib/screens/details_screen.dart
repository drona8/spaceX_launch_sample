import 'package:flutter/material.dart';
import 'package:sampleapp/widgets/app_tile.dart';

import '../models/launch.dart';
import '../models/rocket.dart';
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
        CommonWidget.getVariableHeightSizedBox(10),
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
        CommonWidget.getVariableHeightSizedBox(20),
        CommonWidget.getResultRow(
          context,
          'Rocket Details',
          launch.rocket == null ? 'N/A' : '',
        ),
        CommonWidget.getVariableHeightSizedBox(10),
        launch.rocket != null
            ? _getRocketDetails(launch.rocket!)
            : const SizedBox.shrink(),
        CommonWidget.getVariableHeightSizedBox(20),
        CommonWidget.getResultRow(
          context,
          'Ship Details',
          launch.ships == null ||
                  (launch.ships != null && launch.ships!.isEmpty)
              ? 'N/A'
              : '',
        ),
        CommonWidget.getVariableHeightSizedBox(10),
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

  Widget _getRocketDetails(Rocket rocket) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      shadowColor: const Color.fromRGBO(105, 105, 105, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CommonWidget.getResultRow(
              context,
              'ID',
              rocket.rocketId == null ? 'N/A' : rocket.rocketId!,
            ),
            CommonWidget.getResultRow(
              context,
              'Name',
              rocket.rocketName == null ? 'N/A' : rocket.rocketName!,
            ),
            CommonWidget.getResultRow(
              context,
              'Type',
              rocket.rocketType == null ? 'N/A' : rocket.rocketType!,
            ),
            CommonWidget.getResultRow(
              context,
              'Company',
              rocket.company == null ? 'N/A' : rocket.company!,
            ),
            CommonWidget.getResultRow(
              context,
              'Country',
              rocket.country == null ? 'N/A' : rocket.country!,
            ),
            CommonWidget.getResultRow(
              context,
              'Type',
              rocket.engineType == null ? 'N/A' : rocket.engineType!,
            ),
            CommonWidget.getResultRow(
              context,
              'Layout',
              rocket.engineLayout == null ? 'N/A' : rocket.engineLayout!,
            ),
            CommonWidget.getResultRow(
              context,
              'Cost/Launch',
              rocket.costPerLaunch == null
                  ? 'N/A'
                  : rocket.costPerLaunch!.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
