import 'package:bikes/providers/products_provider.dart';
import 'package:bikes/screens/details/detail_screen.dart';
import 'package:bikes/screens/widgets/bike_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController con;
  int page = 1;


  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title:  Text('Are you sure?'),
        content:  Text('Do you want to exit an App'),
        actions: <Widget>[
           FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child:  Text('No'),
          ),
           FlatButton(
            onPressed: () => SystemNavigator.pop(),
            child:  Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  void initState() {
    super.initState();

     Provider.of<ProductsProvider>(context,listen: false).getProducts(page: 1);
    con = ScrollController();
    con.addListener(() {
      if (con.offset >= con.position.maxScrollExtent &&
          !con.position.outOfRange) {

        Provider.of<ProductsProvider>(context,listen: false).getProducts(page:page+=1);
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductsProvider>(context);
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: productProvider.isLoading()?Center(child: CircularProgressIndicator(backgroundColor: Colors.white,)):
        SafeArea(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                GestureDetector(
                  onTap: () async{
                    await _onWillPop();
                  },
                  child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                        border: Border.all(
                          color: Colors.grey[300],
                          width: 1,
                        ),
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.black,
                        size: 28,
                      )
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                Text(
                  "Available Bikes (" + productProvider.productsData.total.toString() + ")",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                Expanded(
                  child: GridView.builder(
                    controller: con,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 0.7
                    ),
                    itemCount: productProvider.bikesList.length,
                    itemBuilder: (BuildContext context, int index){
                      return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailScreen(bike:productProvider.bikesList[index])),
                            );
                          },
                          child: buildBike(productProvider.bikesList[index], null)
                      );
                    },
                    physics: BouncingScrollPhysics(),
                  ),
                ),
                (productProvider.moreLoading && productProvider.productsData.nextPageUrl!=null) ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white,))
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }

}