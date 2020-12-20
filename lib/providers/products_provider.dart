import 'package:bikes/models/bike_model.dart';
import 'package:bikes/models/bikes_data_model.dart';
import 'package:bikes/models/products_response.dart';
import 'package:bikes/network/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductsProvider with ChangeNotifier {
  bool loading = false;
  bool moreLoading = false;

  ProductResponse productResponse = ProductResponse();
  Data productsData = Data();
  List<Bike> bikesList = [] ;

  Future<bool> getProducts({int page}) async {
    if (page == 1) {
      bikesList.clear();
      productsData = Data();
    }
    page == 1 ? setLoading(true) : setMoreLoading(true);
    try {
      Response response = await get(AppUrl.products+'?page=$page',);
      if (response != null && response.statusCode == 200) {
        productResponse =
            productResponseFromJson(response.body);

       productsData = productResponse.data;

       bikesList.addAll(productsData.bike);

        print("bikes are :" + bikesList.toString());

        page == 1 ? setLoading(false) : setMoreLoading(false);
        return true;
      }

      if (productResponse == null && response.statusCode !=200) {

        page == 1 ? setLoading(false) : setMoreLoading(false);

        return false;
      }
      page == 1 ? setLoading(false) : setMoreLoading(false);
      return false;
    } catch (e) {
      print("error : " + e.toString());
      page == 1 ? setLoading(false) : setMoreLoading(false);
      return false;
    }
  }

  void setLoading(bool value ) {
    loading = value ;
    notifyListeners();
  }

  bool isLoading() {
    return loading ;
  }

  void setMoreLoading(bool value ) {
    moreLoading = value ;
    notifyListeners();
  }

  bool isMoreLoading() {
    return moreLoading ;
  }
}
