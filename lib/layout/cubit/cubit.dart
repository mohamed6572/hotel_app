import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_app/layout/cubit/states.dart';
import 'package:hotel_app/model/hotel_model.dart';
import 'package:hotel_app/shared/network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  HotelModel? hotelModel;
  void getHotelData() {

    Dio_Helper.getData(
    ).then((value) {
      hotelModel = HotelModel.fromJson(value.data);
      print(hotelModel?.data?[0].name);
      // hotels = [];
      // dynamic values = [];
      // values = value.data;
      //
      // print(values);
      // if (values.length > 0) {
      //   for (int i = 1; i < values.length; i++) {
      //     if (values[i] != null) {
      //       hotels.add(HotelModel.fromJson(value.data));
      //     }
      //   }
      // }


      emit(getDataSucssesState());
    }).catchError((e) {
      print(e);
      emit(getDataErrorState());
    });
  }
}
