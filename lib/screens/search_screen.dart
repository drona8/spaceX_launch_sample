import 'package:flutter/material.dart';
import 'package:sampleapp/services/api.dart';
import 'package:sampleapp/utilities/app_utility.dart';
import 'package:sampleapp/widgets/common_widget.dart';
import 'package:sampleapp/widgets/text_widget.dart';

import '../models/launch.dart';
import '../style/styles.dart';
import '../utilities/app_constants.dart';
import '../widgets/spacex_button.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool _isDisabled = true;
  bool _shouldApiBeCalled = false;
  bool _shouldShowResult = false;
  late TextEditingController _searchController;
  late FocusNode _focus;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _focus = FocusNode();
    _focus.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focus.hasFocus) {
      setState(() {
        _shouldApiBeCalled = false;
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstant.appTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CommonWidget.getVariableHeightSizedBox(20),
              TextWidget(
                hintText: 'Launch ID',
                onChangedFunction: onChanged,
                controller: _searchController,
                focusNode: _focus,
              ),
              CommonWidget.getVariableHeightSizedBox(20),
              CommonWidget.getSizedBoxWithChild(
                MediaQuery.of(context).size.width * 0.5,
                50,
                _getSpaceXButton(),
              ),
              CommonWidget.getVariableHeightSizedBox(40),
              _shouldShowResult
                  ? Expanded(
                      child: _shouldApiBeCalled
                          ? _getResultBuilder(context)
                          : const Text(AppConstant.invalidInputError))
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }

  Widget _getResultRow(String label, String data) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Text(
              label,
              style: hintStyleblacktextPSB(),
              textAlign: TextAlign.right,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          Expanded(child: Text(data)),
        ],
      ),
    );
  }

  void onChanged(String value) {
    setState(() {
      _shouldShowResult = false;
      _shouldApiBeCalled = false;
    });
    if (value.isEmpty) {
      setState(() {
        _isDisabled = true;
      });
    } else {
      setState(() {
        _isDisabled = false;
      });
    }
  }

  Widget _getResultBuilder(BuildContext context) {
    return FutureBuilder<Launch>(
      future: Api.getLaunchById(_searchController.text),
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
                  _getResultRow(
                    'Launch ID:',
                    _launch.id,
                  ),
                  _getResultRow(
                    'Launch Name:',
                    _launch.launchName,
                  ),
                  _getResultRow(
                    'Launch Date:',
                    AppUtility.formateDate(_launch.launchDate),
                  ),
                ],
              );
            }
        }
      },
    );
  }

  Widget _getSpaceXButton() {
    return SpaceXButton(
      child: _getInnerChildOfSpaceXButton(),
      onPressed: _isDisabled ? null : _onPressed,
      isDisabled: _isDisabled,
    );
  }

  Widget _getInnerChildOfSpaceXButton() {
    return Text(
      AppConstant.searchButton,
      style: hintStylewhitetextPSB(),
    );
  }

  void _onPressed() async {
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {
      _shouldShowResult = false;
    });
    if (double.tryParse(_searchController.text) != null) {
      setState(() {
        _shouldApiBeCalled = true;
      });
    } else {
      setState(() {
        _shouldApiBeCalled = false;
      });
    }
    setState(() {
      _shouldShowResult = true;
    });
  }
}
