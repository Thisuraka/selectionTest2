import 'api_caller.dart';
import 'api_response.dart';

class ApiCalls {
  static Future<ApiResponse> predictMedicineFromSymptom(
      {required List<dynamic> symptoms}) async {
    try {
      var data = <String, dynamic>{};
      data['disease'] = symptoms;

      Map<String, String> headers = new Map();
      headers["Accept"] = "application/json";
      headers["content-type"] = "application/json";

      return ApiCaller.postRequest('/disease', data: data, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getStage({required List<dynamic> symptoms}) async {
    try {
      var data = <String, dynamic>{};
      data['disease'] = symptoms;

      Map<String, String> headers = new Map();
      headers["Accept"] = "application/json";
      headers["content-type"] = "application/json";

      return ApiCaller.postRequest('/stage', data: data, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> getMedicine(
      {required String disease, required String stage}) async {
    try {
      var data = <String, dynamic>{};
      data['prognosis'] = disease;
      data['stage'] = stage;

      Map<String, String> headers = new Map();
      headers["Accept"] = "application/json";
      headers["content-type"] = "application/json";

      return ApiCaller.postRequest('/medi', data: data, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }

  static Future<ApiResponse> sendImage({required String image}) async {
    try {
      var data = <String, dynamic>{};
      data['disease'] = image;

      Map<String, String> headers = new Map();
      headers["Accept"] = "application/json";
      headers["content-type"] = "application/json";

      return ApiCaller.postRequest('/decodejson', data: data, headers: headers);
    } catch (e) {
      ApiResponse response = ApiResponse();
      response.isSuccess = false;
      response.statusMessage = e.toString();
      return response;
    }
  }
}
