import 'package:dio/dio.dart';

class Dio_Helper{

  static late Dio dio ;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://sandbox.impala.travel/v1/',
        receiveDataWhenStatusError: true
      )
    );
  }

  static Future<Response> getData()async{
    dio.options.headers = {


      'X-API-KEY': 'sandb_KVdPPwthnILRJSwpkmPHgrWdsFfdEg6qmMCAuUlc',
    };
    return await dio.get('hotels?start=2022-08-07&end=2022-08-20&latitude=58.386186&longitude=-9.952560&radius=25000&size=40&offset=0' );
  }

}