import 'package:flutter/material.dart';

import '../models/launch.dart';
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder<Launch>(
            future: Api.getLaunchDetailsById(widget.id),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                  return const Center(
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: orange,
                      ),
                    ),
                  );
                default:
                  if (snapshot.hasError) {
                    return const Text(AppConstant.invalidInputError);
                  } else if (!snapshot.hasData) {
                    return const Text(AppConstant.invalidInputError);
                  } else {
                    Launch _launch = snapshot.data!;
                    return Column(
                      children: [
                        CommonWidget.getResultRow(
                          context,
                          'Launch ID:',
                          _launch.id,
                        ),
                        CommonWidget.getResultRow(
                          context,
                          'Launch Name:',
                          _launch.launchName,
                        ),
                        CommonWidget.getResultRow(
                          context,
                          'Launch Date:',
                          AppUtility.formateDate(_launch.launchDate),
                        ),
                      ],
                    );
                  }
              }
            },
          ),
        ),
      ),
    );
  }
}
