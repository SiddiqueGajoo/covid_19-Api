import 'package:covid_app/View/detail_screen.dart';
import 'package:covid_app/ViewModel/world_states_view_model.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({Key? key}) : super(key: key);

  @override
  _CountriesListScreenState createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WorldStatesViewModel newsListViewModel = WorldStatesViewModel();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  hintText: 'Search with country name',
                  suffixIcon: searchController.text.isEmpty
                      ? const Icon(Icons.search)
                      : GestureDetector(
                      onTap: () {
                        searchController.text = "";
                        setState(() {});
                      },
                      child: const Icon(Icons.clear)),
                ),
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: newsListViewModel.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          enabled: true,
                          child: Column(
                            children: [
                              ListTile(
                                leading:reusableContainer(height: 50, width: 50),
                                title:reusableContainer(height: 8.0, width: 100),
                                subtitle: reusableContainer(height: 8.0, width: double.infinity),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    final filteredData = searchController.text.isEmpty
                        ? snapshot.data!
                        : snapshot.data!
                        .where((country) => country['country']
                        .toString()
                        .toLowerCase()
                        .contains(searchController.text.toLowerCase()))
                        .toList();

                    return ListView.builder(
                      itemCount: filteredData.length,
                      itemBuilder: (context, index) {
                        final country = filteredData[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  image: country['countryInfo']['flag'],
                                  name: country['country'],
                                  totalCases: country['cases'],
                                  totalRecovered: country['recovered'],
                                  totalDeaths: country['deaths'],
                                  active: country['active'],
                                  test: country['tests'],
                                  todayRecovered: country['todayRecovered'],
                                  critical: country['critical'],
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              ListTile(
                                leading: Image(
                                  height: 50,
                                  width: 50,
                                  image: NetworkImage(country['countryInfo']['flag']),
                                ),
                                title: Text(country['country']),
                                subtitle: Text(
                                    "Effected: ${country['cases'].toString()}"),
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class reusableContainer extends StatelessWidget {
   final height, width;
   reusableContainer({required this.height,required this.width,super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        color: Colors.white,
    );
  }
}
