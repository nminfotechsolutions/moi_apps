class PlacesResponse {
  String status;
  List<CityAndNameData> data;

  PlacesResponse({required this.status, required this.data});

  factory PlacesResponse.fromJson(Map<String, dynamic> json) {
    return PlacesResponse(
      status: json['status'],
      data: (json['data'] as List)
          .map((item) => CityAndNameData.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class CityAndNameData {
  String billNo;
  String cityIni;
  String cityName;
  String memMobileNo;
  String memIni;
  String memName;
  String memSpouse;
  String memWork;
  String memEdu;
  String amount;

  CityAndNameData({
    required this.billNo,
    required this.cityIni,
    required this.cityName,
    required this.memMobileNo,
    required this.memIni,
    required this.memName,
    required this.memSpouse,
    required this.memWork,
    required this.memEdu,
    required this.amount,
  });

  factory CityAndNameData.fromJson(Map<String, dynamic> json) {
    return CityAndNameData(
      billNo: json['BillNo'] ?? '',
      cityIni: json['CityIni'] ?? '',
      cityName: json['cityName'] ?? '',
      memMobileNo: json['memMobileNo'] ?? '',
      memIni: json['memIni'] ?? '',
      memName: json['MemName'] ?? '',
      memSpouse: json['memSpouse'] ?? '',
      memWork: json['memWork'] ?? '',
      memEdu: json['MemEdu'] ?? '',
      amount: json['Amount'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'BillNo': billNo,
      'CityIni': cityIni,
      'cityName': cityName,
      'memMobileNo': memMobileNo,
      'memIni': memIni,
      'MemName': memName,
      'memSpouse': memSpouse,
      'memWork': memWork,
      'MemEdu': memEdu,
      'Amount': amount,
    };
  }
}
