import 'package:flutter/material.dart';
import 'package:location_finder/models/district_model.dart';
import 'package:location_finder/models/sub_district_model.dart';
import 'package:location_finder/provider/location_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void didChangeDependencies() {
    Provider.of<LocationProvider>(context, listen: false).getDistrictData();
    Provider.of<LocationProvider>(context, listen: false).getSubDistrictData();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LocationProvider>(
        builder: (context, provider, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: provider.divValue,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: provider.divList.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    provider.divValue = newValue!;
                    print("selected ${newValue}");
                    provider.findDistrictWithDivision(newValue);
                  });
                },
              ),
              DropdownButtonFormField<DistrictModel>(
                hint: const Text('Select Category'),
                value: provider.districtValue,
                isExpanded: true,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
                items: provider.districtList
                    .map((value) => DropdownMenuItem(
                        value: value, child: Text(value.name!)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    provider.districtValue = value;
                    provider.findSubDistrictWithDistrict(value!);
                  });
                },
              ),
              DropdownButtonFormField<SubDistrictModel>(
                hint: const Text('Select Category'),
                value: provider.subDistrictValue,
                isExpanded: true,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a category';
                  }
                  return null;
                },
                items: provider.subDistrictList
                    .map((value) => DropdownMenuItem(
                        value: value, child: Text(value.name!)))
                    .toList(),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
