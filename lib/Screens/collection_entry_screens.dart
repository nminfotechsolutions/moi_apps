import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moi_apps/controller/collection_data_controller.dart';

import '../model/places_response.dart';

class CollectionMoiEntry extends StatefulWidget {
  const CollectionMoiEntry({super.key});

  @override
  State<CollectionMoiEntry> createState() => _CollectionMoiEntryState();
}

class _CollectionMoiEntryState extends State<CollectionMoiEntry> {
  TextEditingController controller = TextEditingController();
  final CollectionDataController collectionDataController = Get.put(
    CollectionDataController(),
  );
  void onSearchChanged(String value) async {
    final filtered = await collectionDataController.filterData(
      collectionDataController.allCityData,
      value,
    );
    collectionDataController.filteredList.value = filtered;
  }

  @override
  void initState() {
    super.initState();
    collectionDataController.fetchAllCityAndName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            color: Colors.indigo.shade900,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Text(
                  'Search city/name',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: controller,
                        decoration: InputDecoration(
                          hintText: "search...",
                          hintStyle: TextStyle(color: Colors.grey[500]),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 16,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (text) {
                          collectionDataController.searchText.value = text;
                          onSearchChanged(text);
                        },
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.mic, color: Colors.white),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              final filteredList = collectionDataController.filteredList;

              if (collectionDataController.allCityData.isEmpty) {
                return Center(child: CircularProgressIndicator());
              }

              if (filteredList.isEmpty) {
                return Center(child: Text('No data found'));
              }

              return ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final bill = filteredList[index];

                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width: 1),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Name: ${bill.memName}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'City: ${bill.cityName}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Amount: ₹${bill.amount}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green[700],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
